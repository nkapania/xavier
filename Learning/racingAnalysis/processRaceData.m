clear all; close all; clc;


br{1} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu94unmanned_HL_2014-10-07_aa.mat');
br{2} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu92unmanned_HL_2014-10-07_aa.mat');
br{3} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\09g_HL_2014-10-06_aa.mat');
br{4} = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\fullautomu9base_2015-07-21_aa.mat');
br{5} = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\fullautomu90base_2015-06-24_aa.mat');
br{6} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits95noesp_HL_2015-07-21_aa.mat');
br{7} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\fullautomu9_HL_2015-07-21_aa.mat');
br{8} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsmorekxfull_HL_2015-07-22_aa.mat');
br{9} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-21_aa.mat');
br{10} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsfull_HL_2015-07-22_aa.mat');
br{11} = load('C:\Users\ddl\Documents\localTestData\2015 08 25 Lap Time\fullauto_mu9_HL_2015-08-25_aa.mat')
br{12} = load('C:\Users\ddl\Documents\localTestData\2015 08 25 Lap Time\fullautopractice_HL_2015-08-25_aa.mat');
br{13} = load('C:\Users\ddl\Documents\localTestData\2015 08 25 Lap Time\unmannedlaptime_HL_2015-08-25_aa.mat');
br{14} = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9quill_2015-09-30_aa.mat');
br{15} = load('C:\Users\ddl\Documents\localTestData\2015 11 Catastrophe\catastrophe_2015-11-23_aa.mat');




%s{1} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu94unmanned_HL_2014-10-07_aa.mat');
%s{2} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu92unmanned_HL_2014-10-07_aa.mat');
%s{3} = load('C:\Users\ddl\Documents\localTestData\2015 08 25 Lap Time\unmannedlaptime_HL_2015-08-25_aa.mat');



% g{1} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\ridealongvincent_HL_2014-10-06_aa.mat');
% g{2} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\ridealongkegs_HL_2014-10-06_aa.mat');
% g{3} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\ridealongjoe_HL_2014-10-06_aa.mat');
% g{4} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_ae.mat');
% g{5} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_ad.mat');
% g{6} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_ac.mat');
% g{7} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_ab.mat');
% g{8} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_gunnarJeanetteDriving\gunnar_HL_2014-10-06_aa.mat');
% d{1} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_davidVoddenDriving\david_HL_2014-10-07_aa.mat');
% d{2} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_davidVoddenDriving\david2_HL_2014-10-07_aa.mat');
% base{1} = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\mu90baselineStitch.mat');
% fg{1} = load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\mu90fgStitch.mat');

% p{1} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-21_aa.mat');
% p{2} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu92_HL_2015-07-23_aa.mat');
% p{3} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu90_HL_2015-07-23_aa.mat');
% p{4} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu85_HL_2015-07-23_aa.mat');
% p{5} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu70_HL_2015-07-23_aa.mat');
% p{6} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu97noaxlim_HL_2015-07-23_aa.mat');
% p{7} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu97_HL_2015-07-22_aa.mat');
% p{8} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu95noaxlim_HL_2015-07-23_aa.mat');
% p{9} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu95_HL_2015-07-22_aa.mat');
% p{10} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu93noaxlim_HL_2015-07-23_aa.mat');
% p{11} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu92_HL_2015-07-22_aa.mat');
% p{12} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu90noaxlim_HL_2015-07-23_aa.mat');
% p{13} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu90_HL_2015-07-22_aa.mat');
% p{14} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu85noaxlim_HL_2015-07-23_aa.mat');
% p{15} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu85_HL_2015-07-23_aa.mat');
% p{16} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu85_HL_2015-07-22_aa.mat');
% p{17} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu7noaxlim_HL_2015-07-23_aa.mat');
% p{18} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu7_HL_2015-07-23_aa.mat');
% p{19} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn4mu90_HL_2015-07-23_aa.mat');
% p{20} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn4mu85_HL_2015-07-23_aa.mat');
% p{21} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn4mu70_HL_2015-07-23_aa.mat');
% p{22} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsmorekxfullwithesp_HL_2015-07-22_aa.mat');
% p{23} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsmorekxfull_HL_2015-07-22_aa.mat');
% p{24} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsmorekx_HL_2015-07-22_aa.mat');
% p{25} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsfull_HL_2015-07-22_aa.mat');
% p{26} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits95noesp_HL_2015-07-21_aa.mat');
% p{27} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits93noesp_HL_2015-07-21_aa.mat');
% p{28} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits93_HL_2015-07-21_aa.mat');
% p{29} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-22_aa.mat');
% p{30} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-21_aa.mat');
% p{31} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits85_HL_2015-07-22_aa.mat');
% p{32} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits85_HL_2015-07-21_aa.mat');
% p{33} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits50_HL_2015-07-22_aa.mat');

% fg{1} = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9FG_2015-09-30_aa.mat');
% q{1}  = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9quill_2015-09-30_aa.mat');

addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
load thunderhill_race.mat; refWorld = mapWorld;

%%
var = br; varStr = 'br';
counter = 0;

for i = 1:len(var)
    N = len(var{i}.t); M = round(N/4); downsampleInd = round(linspace(1, N, M)); 
    sF = zeros(M,1); eF = zeros(M,1); KF = zeros(M,1); dPsiF = zeros(M,1);
    tF = var{i}.t(downsampleInd);
    clear mapMatch;    
    
  %  if ~exist('var.OxTSData')
  %      var{i}.OxTSData = var{i}.ApplanixData;
  %  end
    for j = 1:M
        try
            [eF(j),dPsiF(j),KF(j),sF(j)] = mapMatch(var{i}.OxTSData.posE_m(downsampleInd(j)), var{i}.OxTSData.posN_m(downsampleInd(j)), 0, refWorld);
        catch
            [eF(j),dPsiF(j),KF(j),sF(j)] = mapMatch(var{i}.OxTSData.posE(downsampleInd(j)), var{i}.OxTSData.posN(downsampleInd(j)), 0, refWorld);
        end 
    end
    [lowInd, highInd] = getStartAndEndIndices(sF);
    disp(['Processed Dataset: Found ' num2str(len(lowInd)-1) ' Laps']);
    
    if len(lowInd)-1 <= 0 %assume we have a full lap
        lowInd = [1; 0];
        highInd = [0; M];
    end
        
    for k = 1:len(lowInd)-1
        ind = lowInd(k):highInd(k+1);
        counter = counter+1;
        
        s = sF(ind);
        t = tF(ind) - tF(ind(1));
        e = eF(ind);
        %K = KF(ind);
        dPsi = dPsiF(ind);
        

        try
            Ay = var{i}.calc.ayCGFilt(downsampleInd(ind));
            Ax = var{i}.calc.axCGFilt(downsampleInd(ind));
            beta = var{i}.OxTSData.sideSlip_rad(downsampleInd(ind));
            posE = var{i}.OxTSData.posE_m(downsampleInd(ind));
            posN = var{i}.OxTSData.posN_m(downsampleInd(ind));
            psi = var{i}.OxTSData.yawAngle_rad(downsampleInd(ind));
            alphaF = var{i}.tireSlip.alphaFront_rad(downsampleInd(ind));
            alphaR = var{i}.tireSlip.alphaRear_rad(downsampleInd(ind));
            kappaF = var{i}.tireSlip.kappaFront_unitless(downsampleInd(ind));
            kappaR = var{i}.tireSlip.kappaRear_unitless(downsampleInd(ind));
            throttle = var{i}.TTSdata.throttle_percent(downsampleInd(ind));
            brake    = var{i}.TTSdata.brakePressure_bar(downsampleInd(ind));
            brakeCmd = var{i}.HLlongitudinal.brakeCmd_bar(downsampleInd(ind));
            delta    = var{i}.TTSdata.roadWheelAngle_rad(downsampleInd(ind));
            gear     = var{i}.TTSdata.gearPosition_int(downsampleInd(ind));
            K  = var{i}.mapMatch.curvature_1pm(downsampleInd(ind));
            Ux = var{i}.OxTSData.vxCG_mps(downsampleInd(ind));
            UxDesired = var{i}.HLlongitudinal.UxDesired_mps(downsampleInd(ind));
            AxDesired = var{i}.HLlongitudinal.AxDesired_mps2(downsampleInd(ind));
            eTrue     =  var{i}.mapMatch.e_m(downsampleInd(ind));
        catch
            Ay = var{i}.calc.ayCGFilt(downsampleInd(ind));
            Ax = var{i}.calc.axCGFilt(downsampleInd(ind));
            beta = var{i}.OxTSData.sideSlip(downsampleInd(ind));
            posE = var{i}.OxTSData.posE(downsampleInd(ind));
            posN = var{i}.OxTSData.posN(downsampleInd(ind));
            psi = var{i}.OxTSData.yawAngle(downsampleInd(ind));
            alphaF = var{i}.tireSlip.alphaFront(downsampleInd(ind));
            alphaR = var{i}.tireSlip.alphaRear(downsampleInd(ind));
            kappaF = var{i}.tireSlip.kappaFront(downsampleInd(ind));
            kappaR = var{i}.tireSlip.kappaRear(downsampleInd(ind));
            throttle = var{i}.TTSdata.throttle(downsampleInd(ind));
            brake    = var{i}.TTSdata.brakePressure(downsampleInd(ind));
            brakeCmd = var{i}.HLlongitudinal.brakeCmd(downsampleInd(ind));
            delta    = var{i}.TTSdata.roadWheelAngle(downsampleInd(ind));
            gear     = var{i}.TTSdata.gearPosition(downsampleInd(ind));
            K  = var{i}.mapMatch.curvature(downsampleInd(ind));
            Ux = var{i}.OxTSData.vxCG(downsampleInd(ind));
            UxDesired = var{i}.HLlongitudinal.UxDesired(downsampleInd(ind));
            AxDesired = var{i}.HLlongitudinal.AxDesired(downsampleInd(ind));
            eTrue     =  var{i}.mapMatch.e(downsampleInd(ind));
        end

        
        try
            FxFB     = var{i}.HLlongitudinal.FxFB_N(downsampleInd(ind));
        catch
            FxFB     = var{i}.HLlongitudinal.FxFB(downsampleInd(ind));
        end
        
        
        try
            sTrue    = var{i}.mapMatch.s_m(downsampleInd(ind));
        catch
            sTrue    = var{i}.mapMatch.s(downsampleInd(ind));
        end
        
        sTrue = reshape(sTrue, len(sTrue), 1);
        sTrue = [0; cumsum(max(0, sTrue(2:len(sTrue) ) - sTrue(1:len(sTrue)-1)))];
        lt = cumtrapz(sTrue, 1./Ux);
        
        driver   = var{i}.info.driver;
        info     = var{i}.info;
%        ESP      = var{i}.TTSdata.ESPstatus_bool(downsampleInd(ind));
       % currMu   = var{i}.mapMatch.currMu_unitless(downsampleInd(ind));
        
        
        %segNum   = var{i}.mapMatch.segNumber(downsampleInd(ind));
        
        dir = pwd;
        cd('C:\Users\ddl\Documents\localTestData\brakeFailAnalysis')
        fileName = [varStr num2str(counter)];
        save(fileName,'s', 'eTrue', 't','lt', 'Ux', 'Ax', 'posE', 'posN', 'psi', 'alphaF','brakeCmd','AxDesired', 'alphaR', 'kappaF', 'kappaR', 'throttle', 'brake', 'delta', 'gear', 'e', 'K', 'dPsi','Ay', 'beta', 'UxDesired','FxFB','sTrue','driver','info');
        cd(dir)
        
    end
    
    
    
end
