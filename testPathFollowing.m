close all; clear all; clc;
addpath(genpath('common'))

%load('/home/nkapania/xavier/common/maps/thunderhill_race.mat'); 
load('/home/nkapania/xavier/common/maps/joeFunkeSuperSpeedway_newSkidpad_flat.mat')

veh = getVehicle('nonlinear','closest');
%%
mu = 0.90; ts = .01;
veh1 = veh; veh1.powerLimit = Inf;
vp = getVelocityProfile(world, veh1, mu, 99,.95);

%%
[sim, lapTime] = bikeSim(world, veh, ts, vp);

%%
%plot(world.roadE, world.roadN);
grid on; hold on; axis equal;
plot(sim.posE, sim.posN,'r');
plot(world.roadE, world.roadN);

figure;
plot(sim.t, sim.alphaF*180/pi)
hold on;
plot(sim.t, sim.alphaR*180/pi,'r')

figure;
plot(sim.t, sim.UxDesired);
hold on;
plot(sim.t, sim.Ux,'r');
%Lap Time = 140.49;

figure;
plot(sim.t, sim.FxFB);