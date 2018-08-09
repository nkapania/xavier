close all; clear all; clc;
addpath(genpath('common'))
load('/home/nkapania/xavier/common/maps/THrace.mat')
path = world; path.isOpen = 0;

veh = getVehicle('nonlinear','closest');
vp = generateSpeedTrajectoryClosed(path, veh, 0.5, 0.5);

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
M(:,23) = sim.FxF;
M(:,24) = sim.FxR;
M(:,25) = sim.FyF;
M(:,26) = sim.FyR;
M(:,27) = sim.posE;
M(:,28) = sim.posN;
M(:,29) = sim.psi;

%csvwrite('~/research/PySim/unitTest.csv', M)
%disp('File Saved')  


