close all; clear all; clc;
x1 = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\fullautomu90base_2015-06-24_aa.mat');
x2 = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\fullautoilc9_2015-06-24_aa.mat');

%%
close all; 
ind1 = find(x1.mapMatch.s_m < 1900);
ind2 = find(x2.mapMatch.s_m < 1900);
kLK = x1.params.steeringController.kLK;
xLA = x1.params.steeringController.xLA;

h(1) = subplot(4, 1, 1);
plot(x1.mapMatch.s_m(ind1), x1.mapMatch.e_m(ind1))
hold on;
plot(x2.mapMatch.s_m(ind2), x2.mapMatch.e_m(ind2),'r')

h(2) = subplot(4, 1, 2);
plot(x1.mapMatch.s_m(ind1), x1.tireSlip.alphaFront_rad(ind1)*180/pi,'b')
hold on;
plot(x2.mapMatch.s_m(ind2), x2.tireSlip.alphaFront_rad(ind2)*180/pi,'r')
plot(x1.mapMatch.s_m(ind1), x1.HLsteering.alphaFdes_rad(ind1)*180/pi,'b--')
plot(x2.mapMatch.s_m(ind2), x2.HLsteering.alphaFdes_rad(ind2)*180/pi,'r--')

h(3) = subplot(4, 1, 3);
plot(x1.mapMatch.s_m(ind1), x1.tireSlip.alphaRear_rad(ind1)*180/pi,'b')
hold on;
plot(x2.mapMatch.s_m(ind2), x2.tireSlip.alphaRear_rad(ind2)*180/pi,'r')
plot(x1.mapMatch.s_m(ind1), x1.HLsteering.alphaRdes_rad(ind1)*180/pi,'b--')
plot(x2.mapMatch.s_m(ind2), x2.HLsteering.alphaRdes_rad(ind2)*180/pi,'r--')

h(4) = subplot(4, 1, 4);
plot(x1.mapMatch.s_m(ind1), x1.HLsteering.deltaCmd_rad(ind1)*180/pi,'b')
hold on;
plot(x2.mapMatch.s_m(ind2), x2.HLsteering.deltaCmd_rad(ind2)*180/pi,'r')
plot(x1.mapMatch.s_m(ind1), (x1.HLsteering.deltaFFW_rad(ind1) - kLK*xLA*x1.HLsteering.betaFFW_rad(ind1)  )*180/pi,'b--')
plot(x2.mapMatch.s_m(ind2), (x2.HLsteering.deltaFFW_rad(ind2) - kLK*xLA*x2.HLsteering.betaFFW_rad(ind2)  )*180/pi,'r--')
plot(x2.mapMatch.s_m(ind2), 2.5*x2.mapMatch.curvature_1pm(ind2)*180/pi,'k--')

linkaxes(h,'x')