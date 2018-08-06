%This code loads a recorded trajectory from the Genesis and converts it
%into a world format that is compatible with Nitin's lane following code. 

%Nitin Kapania, Aug 2018


%load Vijay's map
clear all; close all; clc;
vijayWorld = load('/home/nkapania/xavier/common/maps/cpg_clean.mat');

%%

%create s from EN
sRaw= zeros(size(vijayWorld.x))';
x = vijayWorld.x;
y = vijayWorld.y;


%Can be vectorized
for i = 2:len(sRaw)
    sRaw(i) = sRaw(i-1) + norm([x(i) y(i)] - [x(i-1) y(i-1)]);
    
    %get rid of duplicate points
    if sRaw(i) == sRaw(i-1)
        sRaw(i) = sRaw(i) + .01;
    end
end

 


%downsample to a point every 25 cm
s = 0:.25:sRaw(end); s = s';

%interpolate to get roadE and roadN
roadE = interp1(sRaw, x, s);
roadN = interp1(sRaw, y, s);

%get psi from EN
roadPsi = getPsiFromEN(roadE, roadN);

%% HACK ALERT: above function did weird things for backwards compatability
%with quill. We want smooth psi function, so do the following:
shiftInd = 2291;
shiftAmount = 2 * pi;
roadPsi(shiftInd:end) = roadPsi(shiftInd:end) + shiftAmount;

%% may also need to make the world start from 0 to 2*pi
roadPsi = roadPsi - 2*pi;
%plot(roadPsi)

%%
%finally, get curvature - do this by hacking from genWorldFromEN
tempWorld = genWorldFromEN(roadE, roadN);

world.s = s;
world.roadE = roadE;
world.roadN = roadN;
world.roadPsi = roadPsi; 
world.K = tempWorld.K;
world.road_IC = tempWorld.road_IC; 


%% check the plots 
plot(world.s, world.K); xlabel('s (m)'); ylabel('curvature (1/m')
figure;
plot(world.roadE, world.roadN); xlabel('East Position (m)'); ylabel('North Position (m)')
figure;
plot(world.s, world.roadPsi); xlabel('s(m)'); ylabel('\Psi (rad)')


%now, just save the world yourself to where you want it to be.
