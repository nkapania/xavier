close all; clear all; clc;
%load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\simpleRace.mat'); path = world; path.isOpen = 0;path.bank = zeros(len(path.s),3); path.grade = zeros(len(path.s),3);
addpath(genpath('common'))
%path = genWorldFromCSV('thunderhill_race.csv');
load('/home/nkapania/xavier/common/maps/thunderhill_race.mat');
path = mapWorld; path.isOpen = 0;
%bounds = load('thunderhill_bounds_shifted.mat');

veh = getVehicle('nonlinear','embed');
%%
mu = .95; ts = .01;
veh1 = veh; veh1.powerLimit = Inf;
vp = getVelocityProfileBG(path, veh1, mu, 99,.95);

%%
%vp = getConstantVP(path, 20);
[sim, lapTime] = bikeSim(path, veh, ts, vp);

%veh = getVehicle('nonlinear','closest');
%sim2 = bikeSim(mapWorld, veh, ts, vp);

%%
%plot(path.roadE, path.roadN);
grid on; hold on; axis equal;
plot(sim.posE, sim.posN,'r');
plot(path.roadE, path.roadN);

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