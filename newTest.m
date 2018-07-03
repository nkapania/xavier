close all; clear all; clc;
addpath(genpath('common'))
load '/home/nkapania/Desktop/research/simulation/common/maps/simpleRace.mat'
path = world; path.isOpen = 0;

veh = getVehicle('nonlinear','euler');
vp = generateSpeedTrajectory(path, veh);

ts = .01;
[sim, lapTime] = bikeSim(path, veh, ts, vp);


plot(sim.s, sim.e)

%%

M(:,1) = sim.delta;
M(:,2) = sim.deltaFFW;
M(:,3) = sim.deltaFB;
M(:,4) = sim.curvature;
M(:,5) = sim.FxDes;
M(:,6) = sim.UxDesired;
M(:,7) = sim.t;
M(:,8) = sim.alphaR;
M(:,9) = sim.alphaF;
M(:,10) = sim.s;
M(:,11) = sim.Ux;
M(:,12) = sim.Uy;
M(:,13) = sim.r;
M(:,14) = sim.e;
M(:,15) = sim.dPsi;
M(:,16) = sim.betaFFW;
M(:,17) = sim.FyFdes;
M(:,18) = sim.FyRdes;
M(:,19) = sim.alphaFdes;
M(:,20) = sim.alphaRdes;
M(:,21) = sim.FxFFW + sim.FxDrag;
M(:,22) = sim.FxST;


csvwrite('~/Desktop/research/PySim/unitTest.csv', M)
disp('File Saved')  


