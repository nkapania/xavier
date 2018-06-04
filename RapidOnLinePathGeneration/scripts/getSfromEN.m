clear all; close all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

load('C:\Mapping\Maps\Thunderhill\fastGenMap.mat');
load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\thunderhill_bounds_shifted.mat')
load('C:\Users\ddl\Documents\localTestData\2015 5 28 FastMapGen\getbankandgraderace_2015-05-27_aa.mat')
load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\THcenter.mat')
clear mapMatch;

plot(in(:,1), in(:,2),'k');
grid on; hold on; axis equal;
plot(out(:,1), out(:,2),'k');
plot(mapWorld.roadE, mapWorld.roadN,'r');
plot(OxTSData.posE_m, OxTSData.posN_m);
plot(refWorld.roadE, refWorld.roadN,'k--','LineWidth',2);


%%
[xClick, yClick] = ginput(1);
clear mapMatch
[~, ~, ~, s] = mapMatch(xClick, yClick, 0, refWorld)

