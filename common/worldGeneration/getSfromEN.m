clear all; close all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

%f = load('C:\Mapping\Maps\Thunderhill\fastGenMap.mat');
%b = load('C:\Mapping\Maps\Thunderhill\thunderhill_race.mat');
%g = shiftWorld(genWorldFromCSV('Gunnar92.csv'), 170);
load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\thunderhill_bounds_west.mat')
load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\THcenterWest.mat')
clear mapMatch;

plot(in(:,1), in(:,2),'k');
grid on; hold on; axis equal;
plot(out(:,1), out(:,2),'k');
%plot(f.mapWorld.roadE, f.mapWorld.roadN,'b');
%plot(b.mapWorld.roadE, b.mapWorld.roadN,'r');
%plot(g.roadE, g.roadN,'g');
plot(refWorld.roadE, refWorld.roadN,'r--','LineWidth',2);


%%
[xClick, yClick] = ginput(1);
clear mapMatch
[~, ~, ~, s] = mapMatch(xClick, yClick, 0, refWorld)

