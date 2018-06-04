clear all; close all; clc;
load('C:\Users\ddl\Desktop\intermed.mat'); %already have centerline XYZ
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));


posE = cl(:,1);
posN = cl(:,2);
M = round(s(end)/20);
N = len(s);
ind = ceil(linspace(1, N, M));

ppE = spline(s(ind), posE(ind));
ppN = spline(s(ind), posN(ind));

ppEd = ppE; ppEd.coefs = ppE.coefs*diag([3 2 1],1);
ppNd = ppN; ppNd.coefs = ppN.coefs*diag([3 2 1],1);
ppEdd = ppEd; ppEdd.coefs = ppEd.coefs*diag([3 2 1],1);
ppNdd = ppNd; ppNdd.coefs = ppNd.coefs*diag([3 2 1],1);

x  = ppval(ppE , s);  x1 = ppval(ppEd, s); x2 = ppval(ppEdd, s);
y  = ppval(ppN    , s);  y1 = ppval(ppNd, s); y2 = ppval(ppNdd, s);
K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
roadPsi = getPsiFromEN(x, y);
road_IC = [psi(1); posE(1); posN(1)];

refWorld.s = s;
refWorld.roadE = posE;
refWorld.roadN = posN;
refWorld.roadPsi = roadPsi; 
refWorld.K = K;
refWorld.road_IC = road_IC;