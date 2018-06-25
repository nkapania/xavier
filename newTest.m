close all; clear all; clc;
addpath(genpath('common'))
load '/home/nkapania/Desktop/research/simulation/common/maps/simpleRace.mat'
path = world; path.isOpen = 0;

veh = getVehicle('nonlinear','euler');
vp = generateSpeedTrajectory(path, veh);

ts = .01;
[sim, lapTime] = bikeSim(path, veh, ts, vp);


%plot(vp.s, vp.Ux)

%%