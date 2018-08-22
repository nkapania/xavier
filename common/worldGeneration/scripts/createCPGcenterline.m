clear all; close all; clc;
load cpg_winding_track.mat

numPoints = 15000; %choose number on par w/ Thunderhill
centerline = getCenterline(in, out, numPoints);

%% plot centerline to check
plot(centerline(:,1), centerline(:,2)); 
grid on; hold on; plot(in(:,1), in(:,2),'k'); plot(out(:,1), out(:,2),'k');

%% make centerline as a world
path = genWorldFromEN(centerline(:,1), centerline(:,2));

% Downsample to even 1 per meter spacing
 
%first, create linearly spaced path with roughly 
sI = 1;
eI = len(path.s);  
% generate new map, with linearly spaced points
newPath.s = linspace(0, path.s(eI)- path.s(sI), len(path.s(sI:eI)))';
newPath.roadE = interp1(path.s(sI:eI), path.roadE(sI:eI), newPath.s+path.s(sI));
newPath.roadN = interp1(path.s(sI:eI), path.roadN(sI:eI), newPath.s+path.s(sI));
newPath.roadPsi = interp1(path.s(sI:eI), path.roadPsi(sI:eI), newPath.s+path.s(sI));
newPath.K       = interp1(path.s(sI:eI), path.K(sI:eI), newPath.s+path.s(sI));
newPath.road_IC = path.road_IC;
% 

world = newPath;

%% create world and save
save '/home/nkapania/xavier/common/maps/CPGcenter.mat' world
