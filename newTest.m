close all; clear all; clc;
addpath(genpath('common'))
load '/home/nkapania/Desktop/research/simulation/common/maps/simpleRace.mat'
path = world; path.isOpen = 0;

veh = getVehicle('nonlinear','embed');
%plot(veh.alphaFrontTable, veh.FyFtable)
vp = generateSpeedTrajectory(path, veh);

%plot(vp.s, vp.Ux)

%%