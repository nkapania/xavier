clear all; close all; clc;
addpath(genpath('/home/nkapania/xavier/common/'))

load('/home/nkapania/xavier/common/maps/cpgSmooth.mat')
load('/home/nkapania/xavier/common/roadEdges/cpg_winding_track.mat')
clear mapMatch;

plot(in(:,1), in(:,2),'k');
grid on; hold on; axis equal;
plot(out(:,1), out(:,2),'k');
plot(refWorld.roadE, refWorld.roadN,'r--','LineWidth',2);


%%
[xClick, yClick] = ginput(1);
clear mapMatch
[~, ~, ~, s] = mapMatch(xClick, yClick, 0, refWorld)

