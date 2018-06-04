close all; clear all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
load THcenter.mat

%% Process Human Data

load('C:\Users\ddl\Desktop\nkapania\simulation\RapidPathGeneration\scripts\gunnarData.mat')
s = sG'; eG = eG';


%% Process Min Curvature Data
load('C:\Mapping\Maps\Thunderhill\fastGenMap.mat')
N = len(mapWorld.s); M = round(N/20);
dsInd = round(linspace(1, N, M));
eK = zeros(M, 1); sK = zeros(M,1);

clear mapMatch
for i = 1:M
    [eK(i), ~, ~, sK(i)] = mapMatch(mapWorld.roadE(dsInd(i)), mapWorld.roadN(dsInd(i)), 0, refWorld); 
end


eK = interp1(sK, eK, s, 'linear', 'extrap');

%% Process Min Distance Data

load('C:\Users\ddl\Desktop\nkapania\simulation\common\maps\minDist.mat')
N = len(mapWorld.s); M = round(N/20);
dsInd = round(linspace(1, N, M));
eD = zeros(M, 1); sD = zeros(M,1);

clear mapMatch
for i = 1:M
    [eD(i), ~, ~, sD(i)] = mapMatch(mapWorld.roadE(dsInd(i)), mapWorld.roadN(dsInd(i)), 0, refWorld); 
end

eD = interp1(sD, eD, s, 'linear', 'extrap');

%% Get Noisy Estimates of eta
clearvars -except s eG eK eD
N = len(s);
lam = 1;

cvx_begin
    variable eta(N,1)
    variable e(N,1)
    %minimize norm(eG - e) + lam*norm(eta)
    minimize norm(eG - e) + lam*norm(eta(2:N) - eta(1:N-1))
    subject to
        e == eK.*(1 - eta) + eD.*eta
        eta >= 0
        eta <= 1
        
cvx_end

%%
close all;
h(1) = subplot(2, 1, 1);
plot(s, eG); hold on;
plot(s, eD,'r');
plot(s, eK,'g')
plot(s,  e,'b--','LineWidth',2)
    
h(2) = subplot(2, 1, 2);
plot(s, eta);

linkaxes(h,'x');


%% Save results

factor = .05;
load THcenter.mat
lam2.s = s;
lam2.weights = factor*eta;
refWorld.lam2 = lam2;

save C:\Users\ddl\Desktop\nkapania\simulation\common\maps\THcenter.mat refWorld
disp('Updated Lambda Weights')
