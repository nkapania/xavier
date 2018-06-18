close all; clear all; clc;
addpath(genpath('common'))
load '/home/nkapania/Desktop/research/simulation/common/maps/thunderhill_race.mat'
path = mapWorld; path.isOpen = 0;

veh = getVehicle('nonlinear','embed');
plot(veh.alphaFrontTable, veh.FyFtable)

%%