clear all; close all; clc;

addpath('C:\Users\ddl\Documents\localTestData\raceData')
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

s = load('s1');
%d = load('d2');
g = load('g5');
%load('C:\Mapping\Maps\Thunderhill\fastGenMap'); veh = getVehicle('nonlinear','closest');
%vpFG = getVelocityProfileBG(mapWorld, veh, .94, 99, .95);
bounds = load('thunderhill_bounds_shifted');
%load quillVelocityProfile;

%%
close all
plot(bounds.in(:,1), bounds.in(:,2),'k');
hold on; grid on; axis equal;
plot(bounds.out(:,1), bounds.out(:,2),'k');
%plot(s.posE, s.posN,'r')
%plot(d.posE, d.posN,'b')
%plot(g.posE, g.posN,'g')
 plotENfromS(s.s, 500, s.posE, s.posN,'k');
 plotENfromS(s.s, 1700, s.posE, s.posN,'k');
 plotENfromS(s.s, 3300, s.posE, s.posN,'r');
 plotENfromS(s.s, 3700, s.posE, s.posN,'r');
% plotENfromS(s.s, 2568, s.posE, s.posN,'k');
% plotENfromS(s.s, 500, s.posE, s.posN,'k');
% plotENfromS(s.s, 1000, s.posE, s.posN,'k');
% plotENfromS(s.s, 2900, s.posE, s.posN,'k');


indSC = find(s.FxFB < 0);

figure; plot(s.s, s.Ux,'r')
hold on;
plot(g.s, g.Ux,'g')
plot(s.s, s.UxDesired,'r--','LineWidth',2)
%plot(posDesired, sqrt(.97)*UxDesired,'r--')
%plot(vpFG.s, vpFG.Ux,'k')
plot(s.s(indSC), s.Ux(indSC),'ro','MarkerFaceColor','r')
plot(g.s, g.throttle,'g')
plot(s.s, s.throttle,'r')
%plot(d.s, d.Ux,'b')

% figure; plot(s.s, s.Ax,'r')
% hold on;
% plot(g.s, g.Ax,'g')
% plot(d.s, d.Ax,'b')
% 
% figure; plot(s.s, s.Ay,'r')
% hold on;
% plot(g.s, g.Ay,'g')
% plot(d.s, d.Ay,'b')
% 
% figure; plot(s.s, s.t,'r')
% hold on;
% plot(g.s, g.t,'g')
% % plot(d.s, d.t,'b')
% 
% 
figure; plot(s.s, s.t - interp1(g.s, g.t, s.s),'r')
figure; plot(s.s, s.alphaF*180/pi,'r')
hold on;
plot(g.s, g.alphaF*180/pi,'g')
%plot(d.s, d.alphaF*180/pi,'b')
% 
% figure; plot(s.s, s.K)
