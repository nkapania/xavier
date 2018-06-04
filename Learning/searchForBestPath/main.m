clear all; close all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
addpath('C:\Users\ddl\Desktop\nkapania\simulation\Learning\searchForBestPath\velocityGeneration');

K_TOL = 1e-4; %1/m
HEADING_TOL = 3*pi/180; %rad

veh = getVehicle('nonlinear','closest');

disp('Loading Racing Lines');
%load in faster map
load('C:\Mapping\Maps\Thunderhill\fastGenMapMinDistance.mat');
p1 = mapWorld;
vp1 = getVelocityProfileBG(p1, veh, 1);
lt1 = trapz(vp1.s, 1./vp1.Ux);
disp(['Path 1 Lap Time = ' num2str(lt1) ' seconds'])

%load in slower map
load('C:\Mapping\Maps\Thunderhill\thunderhill_race.mat');
p2 = mapWorld;
vp2 = getVelocityProfileBG(p2, veh, 1);
lt2 = trapz(vp2.s, 1./vp2.Ux);
disp(['Path 2 Lap Time = ' num2str(lt2) ' seconds'])

if lt1 > lt2
    error('First Path Must Be Faster Than Second')
end

%%


disp('Finding Switch Points');
%find candidate switch points based on curvature and heading similarity
switchPoints = findSwitchPoints(p1, p2, K_TOL, HEADING_TOL);
disp(['Found ' num2str(len(switchPoints)) ' Switch Points']);

plot(p1.roadE, p1.roadN); hold on; plot(p2.roadE, p2.roadN,'r')
grid on; hold on; axis equal;
plot(p2.roadE(switchPoints), p2.roadN(switchPoints),'k*')



%%
[newPath, vpNew, lt] = evaluateSwitchPoints(veh, p1, p2, switchPoints(8), switchPoints(14), lt1);
figure;
plot(vp1.s, vp1.Ux,'b','LineWidth',2); hold on; plot(vpNew.s, vpNew.Ux,'r','LineWidth',2);
    
