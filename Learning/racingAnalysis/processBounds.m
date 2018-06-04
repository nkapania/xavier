clear all; close all; clc;

addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
load THcenter.mat;
load thunderhill_bounds_shifted;


%%

data = out;

N = len(data(:,1));
M = round(N/10); 
downsampleInd = round(linspace(1, N, M)); 
sF = zeros(M,1); 
eF = zeros(M,1); 
KF = zeros(M,1); 
dPsiF = zeros(M,1);
clear mapMatch;    


for j = 1:M
    [eOut(j),dPsiF(j),KF(j),sOut(j)] = mapMatch(data(downsampleInd(j),1), data(downsampleInd(j),2), 0, refWorld);
end
