clear all; close all; clc;
load /home/nkapania/xavier/common/maps/cpgSmooth.mat
world.friction = 0.5*ones(size(world.s));
world.vMax = 20*ones(size(world.s));
world.isOpen = 1;

%reduce friction to 0.4 locally around the chicane
% ind1 = find(world.s > 2400);
% ind2 = find(world.s < 3500);
% indS = intersect(ind1, ind2);

indS = find(world.s > 2400);

world.friction(indS) = 0.4;
world.vMax(indS) = 15;

plot(world.s, world.friction)

figure;
plot(world.s, world.vMax);



%% save the world
save /home/nkapania/xavier/common/maps/cpgSmoothModifiedFriction.mat world
save /home/nkapania/wolverine/maps/cpgSmoothModifiedFriction.mat world
save /home/nkapania/catkin_ws/src/genesis_path_follower/paths/cpgSmoothModifiedFriction.mat world