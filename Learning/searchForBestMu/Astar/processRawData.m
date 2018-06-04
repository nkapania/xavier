function processRawData(ds)

p{1} = load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-21_aa.mat');
p{2} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu92_HL_2015-07-23_aa.mat');
p{3} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu90_HL_2015-07-23_aa.mat');
p{4} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu85_HL_2015-07-23_aa.mat');
p{5} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn1415mu70_HL_2015-07-23_aa.mat');
p{6} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu97noaxlim_HL_2015-07-23_aa.mat');
p{7} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu97_HL_2015-07-22_aa.mat');
p{8} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu95noaxlim_HL_2015-07-23_aa.mat');
p{9} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu95_HL_2015-07-22_aa.mat');
p{10} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu93noaxlim_HL_2015-07-23_aa.mat');
p{11} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu92_HL_2015-07-22_aa.mat');
p{12} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu90noaxlim_HL_2015-07-23_aa.mat');
p{13} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu90_HL_2015-07-22_aa.mat');
p{14} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu85noaxlim_HL_2015-07-23_aa.mat');
p{15} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu85_HL_2015-07-23_aa.mat');
p{16} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu85_HL_2015-07-22_aa.mat');
p{17} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu7noaxlim_HL_2015-07-23_aa.mat');
p{18} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn10mu7_HL_2015-07-23_aa.mat');
p{19} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn4mu90_HL_2015-07-23_aa.mat');
p{20} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn4mu85_HL_2015-07-23_aa.mat');
p{21} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsturn4mu70_HL_2015-07-23_aa.mat');
p{22} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsmorekxfull_HL_2015-07-22_aa.mat');
p{23} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsmorekx_HL_2015-07-22_aa.mat');
p{24} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimitsfull_HL_2015-07-22_aa.mat');
p{25} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits95noesp_HL_2015-07-21_aa.mat');
p{26} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits93noesp_HL_2015-07-21_aa.mat');
p{27} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits93_HL_2015-07-21_aa.mat');
p{28} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-22_aa.mat');
p{29} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits90_HL_2015-07-21_aa.mat');
p{30} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits85_HL_2015-07-22_aa.mat');
p{31} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits85_HL_2015-07-21_aa.mat');
p{32} =load('C:\Users\ddl\Documents\localTestData\2015 7 23 Race Tuning\tothelimits50_HL_2015-07-22_aa.mat');
p{33} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu94unmanned_HL_2014-10-07_aa.mat');
p{34} = load('C:\Users\ddl\Documents\localTestData\2014 10 NewLapTimeAndProData\_unmannedLapTime\mu92unmanned_HL_2014-10-07_aa.mat');

%%
var = p; varStr = 'p';
counter = 0;
mapLength = var{1}.info.mapData(1,17);
s = ds: ds: mapLength; %lets try spacing every 5 meters to begin with - this is overkill because on the straights we will just be wasting computing time.
                 %better method is to space by time based on velocity profile I think

for i = 1:len(var)
    
    %check that all datasets use the same map
    if var{i}.info.mapData(1,17) ~= mapLength
        error('Not All Datasets Use Same Map')
    end
    
    M = len(var{i}.t);
    try
        [lowInd, highInd] = getStartAndEndIndices(var{i}.mapMatch.s_m);
    catch
        [lowInd, highInd] = getStartAndEndIndices(var{i}.mapMatch.s);
    end
        
    disp(['Processed Dataset: Found ' num2str(len(lowInd)-1) ' Laps']);
    
    if len(lowInd)-1 <= 0 %assume we have a full lap
        lowInd = [1; 0];
        highInd = [0; M];
    end
        
    for k = 1:len(lowInd)-1
        ind = lowInd(k):highInd(k+1);
        counter = counter+1;
        
        %trycatch because of variation in how things are named
        try
            sFull = var{i}.mapMatch.s_m(ind);
            Ux = interp1(sFull, var{i}.OxTSData.vxCG_mps(ind), s, 'linear',0);
            UxDesired = interp1(sFull, var{i}.HLlongitudinal.UxDesired_mps(ind), s, 'linear',0);
            alphaF = interp1(sFull, var{i}.tireSlip.alphaFront_rad(ind), s, 'linear',0);
            alphaR = interp1(sFull, var{i}.tireSlip.alphaRear_rad(ind), s, 'linear',0);
            kappaF = interp1(sFull, var{i}.tireSlip.kappaFront_unitless(ind), s, 'linear',0);
            kappaR = interp1(sFull, var{i}.tireSlip.kappaRear_unitless(ind), s, 'linear',0);
            throttle = interp1(sFull, var{i}.TTSdata.throttle_percent(ind), s, 'linear',0);
            brake    = interp1(sFull, var{i}.TTSdata.brakePressure_bar(ind), s, 'linear',0);
            gear     = interp1(sFull, var{i}.TTSdata.gearPosition_int(ind), s, 'linear',0);
            FxFB     = interp1(sFull, var{i}.HLlongitudinal.FxFB_N(ind), s, 'linear',0);
            currMu   = min( interp1(sFull, var{i}.mapMatch.currFricCoef_unitless(ind), s, 'linear',0)  ,  interp1(sFull, var{i}.HLlongitudinal.muCommand_unitless, s, 'linear',0 ));
            segNum   = interp1(sFull, var{i}.mapMatch.segNumber_int(ind), s, 'linear',0);
            driver   = var{i}.info.driver;
            info     = var{i}.info;
        catch
            sFull = var{i}.mapMatch.s(ind);
            Ux = interp1(sFull, var{i}.OxTSData.vxCG(ind), s, 'linear',0);
            UxDesired = interp1(sFull, var{i}.HLlongitudinal.UxDesired(ind), s, 'linear',0);
            alphaF = interp1(sFull, var{i}.tireSlip.alphaFront(ind), s, 'linear',0);
            alphaR = interp1(sFull, var{i}.tireSlip.alphaRear(ind), s, 'linear',0);
            kappaF = interp1(sFull, var{i}.tireSlip.kappaFront(ind), s, 'linear',0);
            kappaR = interp1(sFull, var{i}.tireSlip.kappaRear(ind), s, 'linear',0);
            throttle = interp1(sFull, var{i}.TTSdata.throttle(ind), s, 'linear',0);
            brake    = interp1(sFull, var{i}.TTSdata.brakePressure(ind), s, 'linear',0);
            gear     = interp1(sFull, var{i}.TTSdata.gearPosition(ind), s, 'linear',0);
            FxFB     = interp1(sFull, var{i}.HLlongitudinal.FxFB(ind), s, 'linear',0);
            currMu   = interp1(sFull, var{i}.mapMatch.currFricCoef(ind), s, 'linear',0);
            segNum   = interp1(sFull, var{i}.mapMatch.segNumber(ind), s, 'linear',0);
            driver   = var{i}.info.driver;
            info     = var{i}.info;
        end
        
        dir = pwd;
        cd('C:\Users\ddl\Documents\localTestData\searchData')
        fileName = [varStr num2str(counter)];
        save(fileName,'s','currMu','segNum', 'Ux', 'alphaF', 'alphaR', 'kappaF', 'kappaR', 'throttle', 'brake', 'gear', 'UxDesired','FxFB','driver','info');
        cd(dir)
        
    end
    
    
    
end
