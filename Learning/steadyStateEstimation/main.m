close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\2015 5 28 ILC\baselinemu85_2015-05-27_aa.mat')
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

a = params.TTS.a; b = params.TTS.b;
m = params.TTS.m; g = 9.81;
L = a+b;

FzF = m*b*g/L; FzR = m*a*g/L;

Cf = linspace(150000, 250000, 30);
Cr = linspace(150000, 250000, 30);

muF = linspace(.9, 1.1, 27); muFhat = .97;
muR = linspace(.95, 1.15, 27); muRhat = 1.05;

FyF = 5000:50:9500; 
FyR = 3000:50:7000;


%%
ALPHA_F = createLookupTable(Cf, muF, FyF, FzF);
ALPHA_R = createLookupTable(Cr, muR, FyR, FzR);

FRONT.alpha = ALPHA_F; FRONT.C = Cf; FRONT.mu = muF; FRONT.Fy = FyF;
REAR.alpha = ALPHA_R; REAR.C = Cr; REAR.mu = muR; REAR.Fy = FyR;


save LOOKUP FRONT REAR
%% 
load LOOKUP

sTable =   [  0;  220;    420;   610;    760;    825;  880;  1065;  1180;    1290;  1380;  1550;   1650;   1807;  1885; 4400; 4520; info.mapData(1,17)]; 
Q = len(sTable); 
muFtable = zeros(Q-1,1); CfTable = zeros(Q-1,1);
muRtable = zeros(Q-1,1); CrTable = zeros(Q-1,1);
Ef ={}; Er = {}; optF = zeros(Q-1, 1); optR = zeros(Q-1,1);

for q = 1:Q-1  %for each turn of thunderhill
    disp(['Estimating Parameters ... ' num2str(q/Q*100,2) ' % Completed'])

    ind = find(mapMatch.s_m > sTable(q) & mapMatch.s_m < sTable(q+1));
    
    FyFss = m*b/L*OxTSData.vxCG_mps(ind).^2.*mapMatch.curvature_1pm(ind);
    FyRss = m*a/L*OxTSData.vxCG_mps(ind).^2.*mapMatch.curvature_1pm(ind);
    alphaFront = tireSlip.alphaFront_rad(ind);
    alphaRear  = tireSlip.alphaRear_rad(ind);
    
    [muFtable(q), CfTable(q), Ef{q}, optF(q)] = minimizeEstimationError(FRONT, FyFss, alphaFront, muFhat);
    [muRtable(q), CrTable(q), Er{q}, optR(q)] = minimizeEstimationError(REAR , FyRss, alphaRear,  muRhat);
    
end

%%
close all;
FyFdes = m*b/L*OxTSData.vxCG_mps.^2.*mapMatch.curvature_1pm;
FyRdes = m*a/L*OxTSData.vxCG_mps.^2.*mapMatch.curvature_1pm;
alphaFdes = getPredictedAlpha(mapMatch.s_m, FyFdes, muFtable, CfTable, sTable, FzF);
alphaRdes = getPredictedAlpha(mapMatch.s_m, FyRdes, muRtable, CrTable, sTable, FzR);

figure;
plot(mapMatch.s_m, tireSlip.alphaFront_rad*180/pi,'r')
grid on; hold on;
plot(mapMatch.s_m, alphaFdes*180/pi,'r--','LineWidth',2)
plot(mapMatch.s_m, tireSlip.alphaRear_rad*180/pi)
plot(mapMatch.s_m, alphaRdes*180/pi,'b--','LineWidth',2)
for i = 2:len(sTable-1)
    line([sTable, sTable],[-4 4],'Color','k','LineWidth',2);
end


figure;
plot(mapMatch.s_m, 180/pi*(HLsteering.deltaFFW_rad - HLsteering.betaFFW_rad*params.steeringController.kLK*params.steeringController.xLA))
hold on; grid on;
deltaFFW = mapMatch.curvature_1pm'*L +alphaRdes - alphaFdes;
betaFFW  = alphaRdes + b*mapMatch.curvature_1pm';
plot(mapMatch.s_m, 180/pi*(deltaFFW - betaFFW*params.steeringController.kLK*params.steeringController.xLA),'r')

for i = 2:len(sTable-1)
    line([sTable, sTable],[-4 4],'Color','k','LineWidth',2);
end

