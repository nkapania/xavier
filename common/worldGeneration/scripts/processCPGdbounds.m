clear all; close all; clc;
addpath(genpath('common'))

%% Load data and check for overlap
load('cpg_winding_track_bounds.mat')

plot(in(:,1), in(:,2),'k'); hold on; grid on; axis equal;
plot(out(:,1), out(:,2),'k');

%% calculate s for both in and out

for i = 2:N
    world.s(i) = world.s(i-1) + norm([world.roadE(i) - world.roadE(i-1); world.roadN(i) - world.roadN(i-1)]);
end

