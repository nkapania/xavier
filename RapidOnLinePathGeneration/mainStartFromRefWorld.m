clear all; close all; clc;
f = filesep;
addpath(genpath(['..' f 'common']));
addpath(genpath(['.' f 'scripts']));
addpath(genpath(['.' f 'CVX']));

%% get vehicle, road friction, and the buffer around the track edge,
%as well as simulation sample time
veh = getVehicle('nonlinear','closest');
mu = .95;
sampleTime = .01;

%% Get World
%get centerline description
%refWorld = genWorldFromCSV('THcenter.csv');

load THcenter.mat; refWorld.isOpen = 0;  %Just load the centerline path since it has been modified to be continuous
bounds = load('thunderhill_bounds_shifted.mat');
%SAMMOD: naming is incorrect in file
bounds.in = bounds.road_bounds_in;
bounds.out = bounds.road_bounds_out;


% refWorld.buff = buff;
tic
refWorld = getLaneWidth(refWorld, bounds);
toc
vpRef = getVelocityProfile(refWorld, veh, mu);

%% If desired, the starting line could already be an optimized version
% This is using N.Kapania OG Generator
useOptimizedLineAsStartingPoint = 1;
if(1 == useOptimizedLineAsStartingPoint)
    % First Optimization loop is used to generate a good ideal line to work with
    % This uses the "original" Min curvature path generator from nitin
    if (2 ~= exist('refWorldOpt.mat','file'))
        %% Start optimization only if no previous data is present
        NUM_ITERS = 4;
        vpRef = getVelocityProfile( refWorld, veh, mu);
        for i = 1:NUM_ITERS
            
            %Solve for Optimal Path
            tic
            opt  = getRapidTrajectory(refWorld, vpRef, veh);
            toc
            world = updateWorldResample(refWorld, opt, bounds);
            
            %generate velocity profile and simulate lap time
            vpRef = getVelocityProfile(world, veh, mu);
            refWorld = world;
        end
        
        optNitin = opt;
        worldNitin = refWorld;
        
        [simRef lapTime] = bikeSim(refWorld, veh, sampleTime, vpRef);
        % Save
        save ('refWorldOpt.mat','refWorld','vpRef','simRef','lapTime');
    end
    
    clear vpRef refWorld simRef laptime
    load 'refWorldOpt.mat'
    
end
%% Start optimization

optWorld = refWorld; % start with the reference World and VP
vpOpt = vpRef;


% set Parameters
NUM_ITERS = 1;
SAFETYBUFFER = 0.5;

N_CVX = 80; %50 points for the cvx formulation

lookaheadDist = 600;
STEPCOUNT = 1;
STEPSIZE = STEPCOUNT*floor(lookaheadDist/N_CVX);
TOTALCOUNT = 20;
START = 300;

%%

s_begin = START;
% idxRef = find(refWorld.s >= s_begin,1);
% wlRef = refWorld.widthLeft(idxRef);
% psiRef = mod(refWorld.roadPsi(idxRef),2*pi);
% 
% wlOpt = wlRef; 
% psiOpt = psiRef;


% Set beta and r values as new start state <- this should come from sim
x_0 = [0;0;0;0];
delta_0 = 0;

%%
for k = 1:TOTALCOUNT %START:STEPSIZE:(START+STEPSIZE*STEPCOUNTS)
    % Iterate over the track
    
    optWorld = refWorld; % start with the reference World and VP
    vpOpt = vpRef;
    
    % init Variables
%     s_begin = k; %nice results: 3250;
    s_end = s_begin+ lookaheadDist;
    
    
    %%% initial offset to trajectory (needs to be set to zero after first iteration)
    %%%     veh.e_0 = 0.0; % <- this causes problems for multiple Iterations, as resampling the full world smooths out the offset!
    %%% if(NUM_ITERS > 1 && veh.e_0 ~= 0.0)
    %%%     disp('using offset only recommended for a single iteration - see explanation')
    %%% end
    
    for i = 1:NUM_ITERS
        
        
        
        % initial state:
        veh.x_0 = x_0;
        veh.delta_0 = delta_0;
        
        %     k = s_begin; %running indice - currently not used
        %     s_begin = k;
        %     s_end = k + lookaheadDist;
        if(optWorld.s(end) < s_end)
            disp('Wrap around not implemented!')
        end
        
        %% * Extract a world Segment from current position to the lookahead Distance
        %* this way, the optimization does not see the whole map but only the
        %* relevant part for the optimization                                   **%
        startIndex = find(optWorld.s >= s_begin,1);
        endIndex = find(optWorld.s >= s_end,1);
        indicesWorld = startIndex:endIndex;
        
        worldSegment = trimStruct(optWorld,indicesWorld);
        
        worldSegment.isOpen = 1; % Not a closed map anymore
        
        %% ADD safety boundary by reducing available space
        % -> not very elegant but works
        % THIS IS NECESSARY, BECAUSE CURRENTLY THE LANEWIDTH CALCULATION
        % DOES NOT CARE IF PATH IS INSIDE OR OUTSIDE OF BOUNDS
        % ->> If the path is outside of bounds, the distance outside of the
        % bounds are interpreted as a REMAINING distance to the boundary
        % Therefore the next iteration  thinks that there is even more space to
        % violate
        worldSegment.widthLeft = worldSegment.widthLeft - SAFETYBUFFER;
        worldSegment.widthRight = worldSegment.widthRight + SAFETYBUFFER;
        
        
        %% Solve for Optimal Path
        disp('use CVXgen for "OnLine" path')
        tic
        opt  = getRapidOnlineTrajectory(worldSegment, vpOpt, veh, N_CVX);
        opt.isOpen = 1;
        toc
        
        
        %         disp('use normal CVX for "OffLine" path') % <- only used to compare curvature and speed profile
        %         tic
        %                         opt  = getRapidTrajectorySegment(worldSegment, vpOpt, veh);
        optCVX = opt;
        %         optCVX.isOpen = 1;
        %         opt.isOpen = 1;
        %         toc
        %% update world dependent variables e.g. distance to boundary
        % TODO: see comment in updateWorldSegment
        %
        disp('updateWorld')
        tic
        world = updateWorldSegment(optWorld, opt, bounds,indicesWorld);
        toc
        %%%  % reset offset to trajectory for second iteration
        %%%  veh.e_0 =   0;
        
        
        optWorld = world;
        
        
        %% generate velocity profile and simulate lap time
        %  When reducing the lookahead distance, it is crucial not to overshoot
        %  the original speed profile.
        %  The idea is, that a "long lookahead" takes care of getting most of the
        %  velocity profile correct by respecting multiple upcoming turns
        %  A second "short lookahead" run would then improve on the accuracy but
        %  respect the long lookahead velocity at its end.
        %  The coupling to the vehicles initial velocity has been removed for
        %  showing odd behaviour when doing multiple runs
        
        disp('getVelocityProfile')
        % get speed of original profile
        startIndexVP = find(vpRef.s >= s_begin,1);
        endIndexVP = find(vpRef.s >= s_end,1);
        
        opt.v_0 =  vpRef.Ux(startIndexVP); % UNUSED CURRENTLY
        opt.a_0 = vpRef.Ax(startIndexVP);  % UNUSED CURRENTLY
        opt.v_end = vpRef.Ux(endIndexVP);
        opt.a_end = vpRef.Ax(endIndexVP);
        % get speed for CVXgen generated path
        vpOpt = getVelocityProfileForSegment(opt, veh, mu);
        
        
        optCVX.v_0 =  vpRef.Ux(startIndexVP); % UNUSED CURRENTLY
        optCVX.a_0 = vpRef.Ax(startIndexVP);  % UNUSED CURRENTLY
        optCVX.v_end = vpRef.Ux(endIndexVP);
        optCVX.a_end = vpRef.Ax(endIndexVP);
        % get speed for CVX generated path
        vpOptCVX = getVelocityProfileForSegment(optCVX, veh, mu);
        
        
        %update x0 and delta0
%         if(NUM_ITERS == i)
%             %% Move along the path by the desired count of steps
%             idx = 1+ STEPCOUNT;
%             s_begin = opt.s(idx)
%             
%             betaAndr = opt.x_cvx(3:4,idx);
%             
%             idxRef = find(refWorld.s >= opt.s(idx),1);
%             idxOpt = find(optWorld.s >= opt.s(idx),1);
%         
% 
%             %  get corresponding width and psi from original map to calculate
%             % the lateral error and psi deviation
%             wlRef = refWorld.widthLeft(idxRef);
%             psiRef = mod(refWorld.roadPsi(idxRef),2*pi);
% 
%             wlOpt = optWorld.widthLeft(idxOpt);
%             psiOpt = mod(optWorld.roadPsi(idxOpt),2*pi);
%             
% 
%             % calc new e and dPsi
%             eNew = wlRef-wlOpt
%             dPsiNew = psiOpt - psiRef 
%             
%             delta_0 = opt.delta(idx);
%         else
%             %only change e and dpsi while iterating
%             betaAndr = x_0(3:4);
%             
%             %use last final wOpt as reference
%             idxTemp = find(optWorld.s >= s_begin,1);
%             wlTemp = optWorld.widthLeft(idxTemp);
%             psiTemp = mod(optWorld.roadPsi(idxTemp),2*pi);
%             
%             
%             % calc new e and dPsi
%             eNew = wlTemp - wlOpt
%             dPsiNew = psiTemp - psiOpt
%          end

            %% Set beta and r values as new start state <- this should come from sim
%             x_0 = [eNew;dPsiNew;betaAndr];
      
        
        %simulate and save results for the full map
        %      if (NUM_ITERS == i)
        %          [sim, lapTime(i+1)] = bikeSim(world, veh, sampleTime, vpRef);
        %               D(i).vp = vpOpt; D(i).sim = sim; D(i).opt = opt; D(i).world = world;
        %
        %      end
        
    
    %% plot results
    %     figure(1), close 1 %close 1 required because of annotations in the plot
    %
    %  PLOT COMPARISON TO CVX       plot(refWorld.roadE, refWorld.roadN,'b-')
    %         hold on
    %         plot(refWorld.roadE, refWorld.roadN,'b-')
    %         plot(optCVX.roadE, optCVX.roadN,'g-')
    %         plot(opt.roadE, opt.roadN,'r')%.-','markersize',20)
    %         legend('Reference Path','Off-line Path','On-line Path','Location','North')
    %%
    
    fig = figure(1); subplot 121,
    hold off; grid on; axis equal;
    plot(refWorld.roadE, refWorld.roadN,'b-')
    hold on
    plot(optWorld.roadE, optWorld.roadN,'k--')
    plot(opt.roadE, opt.roadN,'r')%.-','markersize',20)
    legend('Reference Path','New Path','Path Segment','Location','North')
    title([{'Optimized Path vs Reference Path'}])%; {'Black circle marks beginning'}])
    ylabel('N [m]')
    xlabel('E [m]')
    grid on
    plot(bounds.in(:,1), bounds.in(:,2),'k');
    plot(bounds.out(:,1), bounds.out(:,2),'k');
    %     plot(opt.roadE, opt.roadN,'r-')
    
    % Display last index of generation
    % index = find(opt.s > s_begin,1);
    plot(opt.roadE(1), opt.roadN(1),'ko','markersize',20);
    plot(opt.roadE(1), opt.roadN(1),'k.','markersize',10);
    % index = find(opt.s > s_end,1);
    plot(opt.roadE(end), opt.roadN(end),'ro','markersize',20);
    plot(opt.roadE(end), opt.roadN(end),'r.','markersize',10);
    padding = 20;
    axis([min(opt.roadE)-padding max(opt.roadE)+padding min(opt.roadN)-padding max(opt.roadN)+padding]) % zoom into the desired region
    
    
    %         text(opt.roadE(1)+20, opt.roadN(1),'\downarrow','fontsize',20)
    
    subplot 222,hold off, plot(refWorld.s(indicesWorld),refWorld.K(indicesWorld),'b'),hold on, stairs(optCVX.s,optCVX.K,'g'),hold on, stairs(opt.s,opt.K,'r')
    grid on, title('Curvature \kappa')
    xlim([min(opt.s) max(opt.s)])
    ylim([min(refWorld.K(indicesWorld)) max(refWorld.K(indicesWorld))])
    ylabel('\kappa [1/m]')
    %     legend('Ref \kappa','Off-Line \kappa','On-Line \kappa','Location','SouthOutside', 'Orientation','Horizontal')
    
    sRefVP_beg = find(vpRef.s > s_begin,1); sRefVP_end = find(vpRef.s > s_end,1);
    indicesVPref = sRefVP_beg:sRefVP_end;
    subplot 224,hold off, plot(vpRef.s(indicesVPref),vpRef.Ux(indicesVPref),'b',vpOptCVX.s(1:end),vpOptCVX.Ux(1:end),'g-',vpOpt.s(1:end),vpOpt.Ux(1:end),'r')
    grid on, title('Velocity Profile')
    xlim([min(opt.s) max(opt.s)])
    xlabel('s [m]')
    ylabel('U_x [m/s]')
    %     legend('Ref VP','Off-Line VP','On-Line Vp','Location','SouthOutside', 'Orientation','Horizontal')
    
    %     tightfig(fig);
    %     sdf('1x2Wide') % apply export style
    shg
    %%
    % plot with dPsi and e
    %     figure(2)
    %     subplot 232,hold off, stairs(optCVX.s,optCVX.dPsi,'r' ), hold on ,stairs(opt.s,opt.dPsi,'k' ), grid on
    %     legend('Off-Line dPsi' ,'On-Line dPsi' ,'Location','SouthOutside', 'Orientation','Horizontal'), title( 'difference in Psi compared to reference path' )
    %     subplot 233,hold off, stairs( optCVX.s,optCVX.e,'r'), hold on ,stairs(opt.s,opt.e,'k'), grid on
    %     legend( 'Off-Line e' ,'On-Line e','Location','SouthOutside', 'Orientation','Horizontal'), title( 'lateral offset to reference path' )
    
    
    
    end
    
    
    ONLYONESTAGE = 1;
    if(1 == ONLYONESTAGE)
        %% only do outer loop
        % Update initial vehicle state
        idx = 1 + STEPCOUNT;
        s_begin = opt.s(idx);
        % Set beta and r values as new start state <- this should come from sim
%         x_0 = [0;0;opt.x_cvx(3:4,idx)];
%         delta_0 = opt.delta(idx-1);
    else
%     DOTWOSTAGE = 0;
%     if(1 == DOTWOSTAGE)
        
        %
        %
        %
        %   MULTIPLE PASS APPROACH:
        %
        %
        %
        %% Use a short lookahead for a second run
        % Generates a refined path based on an earlier optimized path
        % SRT = SecondRunThrough
        
        SRTworld = optWorld; % start with the previously optimized World
        vpSRT = vpOpt;
        
        % set Parameters
        lookaheadDist_SRT = 300;
        NUM_ITERS_SRT = 1;
        SAFETYBUFFER_SRT = SAFETYBUFFER;
        
        s_beginSRT = s_begin;% + 150;
        s_endSRT = s_beginSRT + lookaheadDist_SRT;
        
        % vehicle state
        %     veh.e_0 = 0;
        
        
        for i = 1:NUM_ITERS_SRT
            
            if(SRTworld.s(end) < s_endSRT)
                disp('Wrap around not implemented!')
            end
            
            %% Extract world Segment for optimization
            startIndex = find(SRTworld.s >= s_beginSRT,1);     endIndex = find(SRTworld.s >= s_endSRT,1);
            indicesWorldSRT = startIndex:endIndex;
            worldSegment = trimStruct(SRTworld,indicesWorldSRT);
            worldSegment.isOpen = 1; % Not a closed map anymore
            
            
            
            
            %% ADD safety boundary by reducing available space -> does this work
            % with values that change sign?
            worldSegment.widthLeft = worldSegment.widthLeft - SAFETYBUFFER_SRT;
            worldSegment.widthRight = worldSegment.widthRight + SAFETYBUFFER_SRT;
            
            
            %% "VIRTUAL" OBSTACLE
            %     worldSegment.widthLeft(270) = -6; %worldSegment.widthLeft(270);
            
            
            
            %% Solve for Optimal Path
            tic
            optSRT  = getRapidOnlineTrajectory(worldSegment, vpSRT, veh);
            toc
            optSRT.isOpen = 1;
            % update world dependent variables e.g. distance to boundary
            SRTworldi = updateWorldSegment(SRTworld, optSRT, bounds,indicesWorldSRT);
            
            %% generate velocity profile and simulate lap time
            disp('getVelocityProfile')
            % get speed of original profile
            startIndexVP = find(vpOpt.s >= s_beginSRT,1);     endIndexVP = find(vpOpt.s >= s_endSRT,1);
            optSRT.v_0 = vpOpt.Ux(startIndexVP);
            optSRT.a_0 = vpOpt.Ax(startIndexVP);
            optSRT.v_end = vpOpt.Ux(endIndexVP);
            optSRT.a_end = vpOpt.Ax(endIndexVP);
            %optWorld.beta_0 = opt.beta_0;
            vpSRT = getVelocityProfileForSegment(optSRT, veh, mu); %Needs fixing
            
            
            SRTworld = SRTworldi;
            
            
            
            
            
            
        end
        
        
        %% plot results
        %     figure(1), close 1 %close 1 required because of annotations in the plot
        fig = figure(11); subplot 121,
        hold off; grid on; axis equal;
        plot(refWorld.roadE, refWorld.roadN,'b-')
        hold on
        plot(optWorld.roadE, optWorld.roadN,'k--')
        %         plot(opt.roadE, opt.roadN,'g')%.-','markersize',20)
        plot(optSRT.roadE, optSRT.roadN,'r')%.-','markersize',20)
        legend('Reference Path','Long Lookahead','Short Lookahead','Location','North')
        title([{'Optimized Path vs Reference Path'}])%; {'Black circle marks beginning'}])
        ylabel('N [m]')
        xlabel('E [m]')
        grid on
        plot(bounds.in(:,1), bounds.in(:,2),'k');
        plot(bounds.out(:,1), bounds.out(:,2),'k');
        %     plot(optSRT.roadE, optSRT.roadN,'r-')
        
        % Display last index of generation
        % index = find(optSRT.s > s_begin,1);
        plot(optSRT.roadE(1), optSRT.roadN(1),'ko','markersize',20);
        plot(optSRT.roadE(1), optSRT.roadN(1),'k.','markersize',10);
        % index = find(optSRT.s > s_end,1);
        plot(optSRT.roadE(end), optSRT.roadN(end),'ro','markersize',20);
        plot(optSRT.roadE(end), optSRT.roadN(end),'r.','markersize',10);
        padding = 20;
        axis([min(optSRT.roadE)-padding max(optSRT.roadE)+padding min(optSRT.roadN)-padding max(optSRT.roadN)+padding]) % zoom into the desired region
        %  axis([min(opt.roadE)-padding max(opt.roadE)+padding min(opt.roadN)-padding max(opt.roadN)+padding]) % zoom into the desired region
        
        subplot 222,hold off, plot(refWorld.s(:),refWorld.K(:),'b'),hold on, stairs(opt.s,opt.K,'g'),hold on, stairs(optSRT.s,optSRT.K,'r')
        grid on, title('Curvature \kappa')
        xlim([min(optCVX.s) max(optCVX.s)])
        startIndex = find(optWorld.s >= s_begin,1);    endIndex = find(optWorld.s >= s_end,1);     indicesWorld = startIndex:endIndex;
        ylim([min(refWorld.K(indicesWorld)) max(refWorld.K(indicesWorld))])
        ylabel('\kappa [1/m]')
        %     legend('Ref \kappa','Off-Line \kappa','On-Line \kappa','Location','SouthOutside', 'Orientation','Horizontal')
        
        sRefVP_beg = find(vpRef.s > s_begin,1); sRefVP_end = find(vpRef.s > s_end,1);
        indicesVPref = sRefVP_beg:sRefVP_end;
        subplot 224,hold off, plot(vpRef.s(indicesVPref),vpRef.Ux(indicesVPref),'b',vpOpt.s(1:end),vpOpt.Ux(1:end),'g-',vpSRT.s(1:end),vpSRT.Ux(1:end),'r')
        grid on, title('Velocity Profile')
        xlim([min(opt.s) max(opt.s)])
        xlabel('s [m]')
        ylabel('U_x [m/s]')
        %     legend('Ref VP','Off-Line VP','On-Line Vp','Location','SouthOutside', 'Orientation','Horizontal')
        shg
        
        %         sdf('1x2Wide') % apply export style
        
        
        
        
        
        
        %%
        % feed the new world into the long lookahead and recalc full velocity
        % profile
        
        
        optWorld = SRTworld;
        
        vpOpt = getVelocityProfile(optWorld, veh, mu);
        
        
        
        % Update initial vehicle state
        idxSRT = floor( N_CVX* STEPSIZE/lookaheadDist_SRT );
        % Set beta and r values as new start state <- this should come from sim
        x_0 = [0;0;optSRT.x_cvx(3:4,idxSRT)];
        delta_0 = optSRT.delta(idxSRT);
        
        %
        %     figure,hold off, plot(vpRef.s(:),vpRef.Ux(:),'b',vpOpt.s(1:end),vpOpt.Ux(1:end),'g-',vpSRT.s(1:end),vpSRT.Ux(1:end),'r')
        %     hold on, plot(vpRefNew.s(1:end),vpRefNew.Ux(1:end),'r')
        %     grid on, title('Velocity Profile')
        %     xlim([min(opt.s) max(opt.s)])
        %     xlabel('s [m]')
        %     ylabel('U_x [m/s]')
        %     %     legend('Ref VP','Off-Line VP','On-Line Vp','Location','SouthOutside', 'Orientation','Horizontal')
        %     shg
        %
        
    end %if DoOnlyOneStage
end




%% Compare to Other Maps
if (2 ~= exist('simTHrace.mat','file'))
    qW = shiftWorld(genWorldFromCSV('THrace.csv'), -576);
    vpQ = getVelocityProfile(downsampleWorld(qW, 10), veh, mu);
    [simQ, lpQ] = bikeSim(qW, veh, sampleTime, vpQ);
    % Save for future simulation runs
    save ('simTHrace.mat','qW','vpQ','simQ','lpQ');
end
load 'simTHrace.mat'

% gW = shiftWorld(genWorldFromCSV('Gunnar92.csv'), 170);
% vpG = getVelocityProfile(downsampleWorld(gW, 10), veh, mu);
%simG = bikeSim(gW, veh, sampleTime, vpG);

%% Plot Results
%close all;
% figure(2);
% hold off
% plot(D(end).sim.posE, D(end).sim.posN,'k');
% hold on; grid on; axis equal;
%
% idx = NUM_ITERS;
% plot(D(idx).world.roadE, D(idx).world.roadN,'k--')
% if exist('qW')
%     plot(qW.roadE, qW.roadN)
%     legend('sim','path','quill')
% else
%     legend('sim','path')
% end
%
% plot(D(idx).world.roadE(1),   D(idx).world.roadN(1),'k*');
% plot(D(idx).world.roadE(end), D(idx).world.roadN(end),'k*');
% plot(bounds.in(:,1), bounds.in(:,2),'r');
% hold on;
% plot(bounds.out(:,1), bounds.out(:,2),'r');
%
% for i = 2:len(world.buff.s)-1
%     x = interp1(world.s, world.roadE, world.buff.s(i));
%     y = interp1(world.s, world.roadN, world.buff.s(i));
%     plot(x, y, 'ko','MarkerFaceColor','g');
% end
%
%
% % Display last index of generation
% index = find(D(idx).world.s > s_begin,1);
% plot(D(idx).world.roadE(index), D(idx).world.roadN(index),'ko','markersize',20);
% plot(D(idx).world.roadE(index), D(idx).world.roadN(index),'k.','markersize',10);
% index = find(D(idx).world.s > s_end,1);
% plot(D(idx).world.roadE(index), D(idx).world.roadN(index),'ro','markersize',20);
% plot(D(idx).world.roadE(index), D(idx).world.roadN(index),'r.','markersize',10);

%%


% figure(3);
% hold on; grid on;
% plot([0:NUM_ITERS], lapTime,'bo','MarkerSize',12,'MarkerFaceColor','b')
% plot([0 NUM_ITERS], [lpQ lpQ],'r','LineWidth',2)
% xlabel('Iteration Number','FontSize',14)
% ylabel('Predicted Lap Time (s)','FontSize',14)
% legend('Fast Gen', 'NL opt')
%
%


