% Generates a refined path based on an earlier optimized path


worldSRT = optWorld; % start with the previously optimized World
vpSRT = vpOpt;
   
% set Parameters
    lookaheadDist = 250;
    NUM_ITERS = 4;
    
% init Variables    
%     s_begin = 3360;
    %s_begin = 836;
%     s_endSRT =  lookaheadDist;
 
veh.e_0 = 0;
    
for i = 1:NUM_ITERS
    
    k = s_begin + 150; %running indice - not used for now 
    s_beginSRT = k;
    s_endSRT = k + lookaheadDist;
    if(worldSRT.s(end) < s_endSRT) 
        disp('Wrap around not implemented!')
    end
        
    % Extract world Segment for optimization
     startIndex = find(worldSRT.s >= s_beginSRT,1);     endIndex = find(worldSRT.s >= s_endSRT,1);
     indicesWorld = startIndex:endIndex;     
     worldSegment = trimStruct(worldSRT,indicesWorld);       
     worldSegment.isOpen = 1; % Not a closed map anymore
     
     
     
     
    % ADD safety boundary by reducing available space -> does this work
    % with values that change sign?
    sftyBuffer = 0.5;
    worldSegment.widthLeft = worldSegment.widthLeft - sftyBuffer;
    worldSegment.widthRight = worldSegment.widthRight + sftyBuffer;
     
    
    % "VIRTUAL" OBSTACLE
%     worldSegment.widthLeft(270) = -6; %worldSegment.widthLeft(270);


     
    % Solve for Optimal Path
    tic
    optSRT  = getRapidOnlineTrajectory(worldSegment, vpSRT, veh); 
    toc
    optSRT.isOpen = 1;
    % update world dependent variables e.g. distance to boundary
    worldiSRT = updateWorldSegment(worldSRT, optSRT, bounds,indicesWorld);
    
    %generate velocity profile and simulate lap time
    disp('getVelocityProfile')
    % get speed of original profile
     startIndexVP = find(vpOpt.s >= s_beginSRT,1);     endIndexVP = find(vpOpt.s >= s_endSRT,1);
    optSRT.v_0 = vpOpt.Ux(startIndexVP); 
    optSRT.a_0 = vpOpt.Ax(startIndexVP);
    optSRT.v_end = vpOpt.Ux(endIndexVP); 
    optSRT.a_end = vpOpt.Ax(endIndexVP);
    %optWorld.beta_0 = opt.beta_0;
    vpSRT = getVelocityProfileForSegment(optSRT, veh, mu); %Needs fixing 
    
    
    worldSRT = worldiSRT;
    
    
    
    
    
    %% plot results
%     figure(1), close 1 %close 1 required because of annotations in the plot
    fig = figure(11+i); subplot 121,
    hold off; grid on; axis equal;
    plot(refWorld.roadE, refWorld.roadN,'b-')
    hold on
    plot(opt.roadE, opt.roadN,'g')%.-','markersize',20)
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
    
%     tightfig(fig);
    sdf('1x2Wide') % apply export style
    
     
    
    
end
