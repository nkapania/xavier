clear all; close all; clc;
addpath(genpath('/home/nkapania/xavier/common'))
addpath(genpath('/home/nkapania/xavier/RapidPathGeneration/scripts'));

%get vehicle, road friction, and the buffer around the track edge,
%as well as simulation sample time
veh = getVehicle('nonlinear','closest'); mu = .9; sampleTime = .01;  
NUM_ITERS = 1;

%get centerline description
%refWorld = genWorldFromCSV('THcenter.csv'); 

load CPGcenter.mat; refWorld = world; refWorld.isOpen = 0;  %Just load the centerline path since it has been modified to be continuous
bounds = load('cpg_winding_track.mat');

%%%%%%%%%% HACK - add in a little more buffer at a few parts of the track -
%%%%%%%%%% better way is to link this to EN coordinates from a user
%%%%%%%%%% specified mat file.

buff.s = [0  ;  refWorld.s(end)];
buff.b = [1  ;  1];

%buff.b = .4*ones(size(buff.s));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

refWorld.buff = buff;
%refWorld = getLaneWidth(refWorld, bounds);
refWorld.widthLeft = 4 * ones(size(refWorld.s));
refWorld.widthRight = -4 * ones(size(refWorld.s));

%%

vpRef = getVelocityProfile( refWorld, veh, mu);
[simRef lapTime] = bikeSim(refWorld, veh, sampleTime, vpRef);

%%

for i = 1:NUM_ITERS

    %Solve for Optimal Path
    opt  = getRapidTrajectory(refWorld, vpRef, veh);
    world = updateWorld(refWorld, opt, bounds);

    %generate velocity profile and simulate lap time
    vpRef = getVelocityProfile(world, veh, mu); 
    
    %simulate results and save data

    [sim lapTime(i+1)] = bikeSim(world, veh, sampleTime, vpRef);
    D(i).vp = vpRef; D(i).sim = sim; D(i).opt = opt; D(i).world = world;
    
    refWorld = world;
end 


%Compare to Other Maps
 qW = shiftWorld(genWorldFromCSV('THrace.csv'), -576-140);
 vpQ = getVelocityProfile(downsampleWorld(qW, 10), veh, mu);
 [simQ, lpQ] = bikeSim(qW, veh, sampleTime, vpQ);

% gW = shiftWorld(genWorldFromCSV('Gunnar92.csv'), 170);
% vpG = getVelocityProfile(downsampleWorld(gW, 10), veh, mu);
%simG = bikeSim(gW, veh, sampleTime, vpG);

%% Plot Results
close all;
figure;
plot(D(end).sim.posE, D(end).sim.posN,'k');
hold on; grid on; axis equal;

idx = NUM_ITERS;
plot(D(idx).world.roadE, D(idx).world.roadN,'k--')
if exist('qW')
    plot(qW.roadE, qW.roadN)
    legend('sim','path','quill')
else
    legend('sim','path')
end

plot(D(idx).world.roadE(1),   D(idx).world.roadN(1),'k*');
plot(D(idx).world.roadE(end), D(idx).world.roadN(end),'k*');
plot(bounds.in(:,1), bounds.in(:,2),'r');
hold on;
plot(bounds.out(:,1), bounds.out(:,2),'r');

for i = 2:len(world.buff.s)-1
    x = interp1(world.s, world.roadE, world.buff.s(i));
    y = interp1(world.s, world.roadN, world.buff.s(i));
    plot(x, y, 'ko','MarkerFaceColor','g');
end

figure;
hold on; grid on;
plot([0:NUM_ITERS], lapTime,'bo','MarkerSize',12,'MarkerFaceColor','b')
plot([0 NUM_ITERS], [lpQ lpQ],'r','LineWidth',2)
xlabel('Iteration Number','FontSize',14)
ylabel('Predicted Lap Time (s)','FontSize',14)
legend('Fast Gen', 'NL opt')
 



