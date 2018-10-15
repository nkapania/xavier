close all; clear all; clc;
addpath(genpath('common'))
load('/home/nkapania/xavier/common/maps/THrace.mat')
path = world; path.isOpen = 0;

veh = getVehicle('nonlinear','closest');
vp = generateSpeedTrajectoryClosed(path, veh, 0.9, 0.9);
plot(vp.s, vp.Ux)
%vp = getVelocityProfile(path, veh, 1.04, 99, 1.0);

%ts = .01;
%[sim, lapTime] = bikeSim(path, veh, ts, vp);


%%
close all; 
load('/home/nkapania/wolverine/test1.mat')
plot(vp.s, vp.Ux); hold on; plot(s, UxDes,'r'); legend('MATLAB','Python');

figure; 
plot(sim.s, sim.Ux); hold on; plot(s, Ux,'r'); legend('MATLAB','Python');

figure; 
plot(sim.s, sim.FxDes); hold on; plot(s, FxCmd,'r'); legend('MATLAB','Python');

figure; 
plot(sim.s, sim.e); hold on; plot(s, e,'r'); legend('MATLAB','Python');

figure; 
plot(sim.s, sim.deltaFFW * 180/pi); hold on; plot(s, deltaFFW * 180/pi,'r'); legend('MATLAB','Python');
