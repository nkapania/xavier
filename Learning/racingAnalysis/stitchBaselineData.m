clear all; close all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

f1 = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\fullautomu90base_2015-06-24_aa.mat');
f2 = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\unmannedmu90base_2015-06-24_ab.mat');
f3 = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\unmannedmu90base_2015-06-24_aa.mat');
f4 = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\fullautomu9base_2015-07-21_aa.mat');

%%

ind0 = find(f4.mapMatch.s_m > 111 & f4.mapMatch.s_m < 1180);
ind1 = find(f1.mapMatch.s_m > 1221 & f1.mapMatch.s_m < 1305);
ind2 = find(f2.mapMatch.s_m > 1305  & f2.mapMatch.s_m < 3487);
ind3 = find(f3.mapMatch.s_m > 3487);
ind4 = find(f3.mapMatch.s_m < 27);

mapMatch.s = [f3.mapMatch.s_m(ind4) f4.mapMatch.s_m(ind0) f1.mapMatch.s_m(ind1) f2.mapMatch.s_m(ind2) f3.mapMatch.s_m(ind3)];
t = 0:.005:.005*(len(mapMatch.s)-1);
OxTSData.vxCG = [f3.OxTSData.vxCG_mps(ind4) f4.OxTSData.vxCG_mps(ind0) f1.OxTSData.vxCG_mps(ind1) f2.OxTSData.vxCG_mps(ind2) f3.OxTSData.vxCG_mps(ind3)];
calc.axCGFilt = [f3.calc.axCGFilt(ind4) f4.calc.axCGFilt(ind0) f1.calc.axCGFilt(ind1) f2.calc.axCGFilt(ind2) f3.calc.axCGFilt(ind3)];
OxTSData.posE = [f3.OxTSData.posE_m(ind4) f4.OxTSData.posE_m(ind0) f1.OxTSData.posE_m(ind1) f2.OxTSData.posE_m(ind2) f3.OxTSData.posE_m(ind3)];
OxTSData.posN = [f3.OxTSData.posN_m(ind4) f4.OxTSData.posN_m(ind0) f1.OxTSData.posN_m(ind1) f2.OxTSData.posN_m(ind2) f3.OxTSData.posN_m(ind3)];
OxTSData.yawAngle = [f3.OxTSData.yawAngle_rad(ind4) f4.OxTSData.yawAngle_rad(ind0) f1.OxTSData.yawAngle_rad(ind1) f2.OxTSData.yawAngle_rad(ind2) f3.OxTSData.yawAngle_rad(ind3)];
tireSlip.alphaFront = [f3.tireSlip.alphaFront_rad(ind4) f4.tireSlip.alphaFront_rad(ind0) f1.tireSlip.alphaFront_rad(ind1) f2.tireSlip.alphaFront_rad(ind2) f3.tireSlip.alphaFront_rad(ind3)];
tireSlip.alphaRear = [f3.tireSlip.alphaRear_rad(ind4) f4.tireSlip.alphaRear_rad(ind0) f1.tireSlip.alphaRear_rad(ind1) f2.tireSlip.alphaRear_rad(ind2) f3.tireSlip.alphaRear_rad(ind3)];
tireSlip.kappaFront = [f3.tireSlip.kappaFront_unitless(ind4) f4.tireSlip.kappaFront_unitless(ind0) f1.tireSlip.kappaFront_unitless(ind1) f2.tireSlip.kappaFront_unitless(ind2) f3.tireSlip.kappaFront_unitless(ind3)];
tireSlip.kappaRear =  [f3.tireSlip.kappaRear_unitless(ind4) f4.tireSlip.kappaRear_unitless(ind0) f1.tireSlip.kappaRear_unitless(ind1) f2.tireSlip.kappaRear_unitless(ind2) f3.tireSlip.kappaRear_unitless(ind3)];
TTSdata.throttle   = [f3.TTSdata.throttle_percent(ind4) f4.TTSdata.throttle_percent(ind0) f1.TTSdata.throttle_percent(ind1) f2.TTSdata.throttle_percent(ind2) f3.TTSdata.throttle_percent(ind3)];
TTSdata.brakePressure   = [f3.TTSdata.brakePressure_bar(ind4) f4.TTSdata.brakePressure_bar(ind0) f1.TTSdata.brakePressure_bar(ind1) f2.TTSdata.brakePressure_bar(ind2) f3.TTSdata.brakePressure_bar(ind3)];
TTSdata.roadWheelAngle   = [f3.TTSdata.roadWheelAngle_rad(ind4) f4.TTSdata.roadWheelAngle_rad(ind0) f1.TTSdata.roadWheelAngle_rad(ind1) f2.TTSdata.roadWheelAngle_rad(ind2) f3.TTSdata.roadWheelAngle_rad(ind3)];
TTSdata.gearPosition   = [f3.TTSdata.gearPosition_int(ind4) f4.TTSdata.gearPosition_int(ind0) f1.TTSdata.gearPosition_int(ind1) f2.TTSdata.gearPosition_int(ind2) f3.TTSdata.gearPosition_int(ind3)];
mapMatch.e   = [f3.mapMatch.e_m(ind4) f4.mapMatch.e_m(ind0) f1.mapMatch.e_m(ind1) f2.mapMatch.e_m(ind2) f3.mapMatch.e_m(ind3)];
mapMatch.curvature   = [f3.mapMatch.curvature_1pm(ind4) f4.mapMatch.curvature_1pm(ind0) f1.mapMatch.curvature_1pm(ind1) f2.mapMatch.curvature_1pm(ind2) f3.mapMatch.curvature_1pm(ind3)];
mapMatch.deltaPsi   = [f3.mapMatch.deltaPsi_rad(ind4) f4.mapMatch.deltaPsi_rad(ind0) f1.mapMatch.deltaPsi_rad(ind1) f2.mapMatch.deltaPsi_rad(ind2) f3.mapMatch.deltaPsi_rad(ind3)];
calc.ayCGFilt   = [f3.calc.ayCGFilt(ind4) f4.calc.ayCGFilt(ind0) f1.calc.ayCGFilt(ind1) f2.calc.ayCGFilt(ind2) f3.calc.ayCGFilt(ind3)];
OxTSData.sideSlip   = [f3.OxTSData.sideSlip_rad(ind4) f4.OxTSData.sideSlip_rad(ind0) f1.OxTSData.sideSlip_rad(ind1) f2.OxTSData.sideSlip_rad(ind2) f3.OxTSData.sideSlip_rad(ind3)];
HLlongitudinal.UxDesired   = [f3.HLlongitudinal.UxDesired_mps(ind4) f4.HLlongitudinal.UxDesired_mps(ind0) f1.HLlongitudinal.UxDesired_mps(ind1) f2.HLlongitudinal.UxDesired_mps(ind2) f3.HLlongitudinal.UxDesired_mps(ind3)];
HLlongitudinal.FxFB   = [f3.HLlongitudinal.FxFB_N(ind4) f4.HLlongitudinal.FxFB_N(ind0) f1.HLlongitudinal.FxFB_N(ind1) f2.HLlongitudinal.FxFB_N(ind2) f3.HLlongitudinal.FxFB_N(ind3)];

%%
save('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\mu90baselineStitch','t','mapMatch','OxTSData','calc','tireSlip','TTSdata','HLlongitudinal');