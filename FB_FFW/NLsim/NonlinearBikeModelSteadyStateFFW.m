clear all; close all; clc;
load('C:\Users\ddl\Documents\localTestData\May2013\fullauto925mu_HL_2013-05-28_aa.mat')
start = 1.13e4;
fin = 4e4;
T = start:fin;



a = 1.0441;
b = 1.4248;
m = 1.5124e+003;
L = a+b;
g = 9.81;
FzF = m/L*(b*g);
FzR = m/L*(a*g);
Cf = 160000;
Cr = 180000;
muP = 1.25;
muS = 1;
xLA = 15.2;
kLK = .0532;
Iz = 2.2499e+003;
ts = .005;

N = numel(T);
s = zeros(N,1);
e = zeros(N,1);
dPsi = zeros(N,1);
FyFFW = zeros(N,1);
Uy = zeros(N,1);
r  = zeros(N,1);
beta = zeros(N,1);

Fx =  zeros(N,1);
alphaF = zeros(N,1);
alphaR = zeros(N,1);
deltaFB = zeros(N,1);
delta = zeros(N,1);
deltaFFW = zeros(N,1);
zetaF = zeros(N,1);
zetaR = zeros(N,1);


s(1) = mapMatch.dstAlongPath(start);
e(1) = mapMatch.e(start);
dPsi(1) = mapMatch.deltaPsi(start);
Uy(1) = ApplanixData.vxCG(start)*tan(ApplanixData.sideSlip(start));
r(1) = ApplanixData.yawRate(start);

Ux = ApplanixData.vxCG(T);
K = .011;
Kug = FzF/Cf - FzR/Cr;

load map
getLookupTables


h = waitbar(0,'Simulating...');

for i = 1:(N-1)
    
    waitbar(i/N)
    
    K = interp1(sData, kData, s(i));
    Fx(i) = m*interp1(sData, ax, s(i));
    
    FyFdes(i) = b/L*m*Ux(i)^2*K;
    FyRdes(i) = a/b*FyFdes(i);
    alphaFdes(i) = interp1(FyFtable, alphaFrontTable, FyFdes(i),'linear',-max(alphaFrontTable)*sign(FyFdes(i)));
    alphaRdes(i) = interp1(FyRtable, alphaRearTable, FyRdes(i),'linear',-max(alphaRearTable)*sign(FyRdes(i)));
    deltaFFW(i) = K*L +alphaRdes(i) - alphaFdes(i);
    
    
    beta(i) = atan(Uy(i)/Ux(i));
    deltaFB(i) = -kLK*e(i) - kLK*xLA*sin(dPsi(i));
    %deltaFB(i) = -kLK*e(i) - kLK*xLA*sin(dPsi(i) + beta(i));
    delta(i) = deltaFB(i) + deltaFFW(i);
    
    alphaF(i) = atan((Uy(i) + a*r(i))/Ux(i)) - delta(i);
    alphaR(i) = atan((Uy(i) - b*r(i))/Ux(i));
%     FyF(i) = tireforces(Cf, muP, muS, alphaF(i), FzF);
%     FyR(i) = tireforces(Cr, muP+.05, muS+.05, alphaR(i), FzR);
    
    [FyF(i) zetaF(i)] = coupledTireForces(alphaF(i), .6*Fx(i), muP, muS, Cf, FzF);
    [FyR(i) zetaR(i)] = coupledTireForces(alphaR(i), .4*Fx(i), muP+.05, muS+.05, Cr, FzR);
    
    dUy = (FyF(i) + FyR(i))/m - r(i)*Ux(i);
    dr = (a*FyF(i) - b*FyR(i))/Iz;
    ds = Ux(i)*cos(dPsi(i)) - Uy(i)*sin(dPsi(i));
    de = Uy(i)*cos(dPsi(i)) + Ux(i)*sin(dPsi(i));
    ddPsi = r(i) - ds*K;
    
    Uy(i+1) = Uy(i) + ts*dUy;
    r(i+1) =  r(i)  + ts*dr;
    s(i+1) =  s(i)  + ts*ds;
    e(i+1) =  e(i)  + ts*de;
    dPsi(i+1) = dPsi(i) + ts*ddPsi;
    
end


plot(t(T), Uy,'LineWidth',2);
ylabel('Uy (m/s)')
legend('Sim','Thunder Hill')

figure;
plot(t(T), r,'LineWidth',2);
xlabel('t (sec)')
ylabel('yaw rate (rad/s)')
legend('Sim','Thunder Hill')

figure;
plot(t(T), delta*180/pi, 'LineWidth',2)
hold on;
plot(t(T), deltaFB*180/pi,'r','LineWidth',2)
plot(t(T), deltaFFW*180/pi,'g','LineWidth',2)
xlabel('t (sec)')
ylabel('delta (deg)')
legend('Total','FB','FFW')

figure; 
plot(t(T), alphaF*180/pi,'LineWidth',2);
hold on; grid on;
xlabel('t (sec)')
ylabel('Front Alpha (deg)')
legend('Sim','Thunder Hill')

figure;
plot(t(T), alphaR*180/pi,'LineWidth',2);
xlabel('t sec')
ylabel('alphaR')
legend('Sim','Thunder Hill')

figure;
plot(t(T), e);
hold on; grid on;
plot(t(T), (dPsi+beta)*180/pi,'r');
plot(t(T), e + xLA*sin(dPsi + beta),'k');
xlabel('t sec')
ylabel('error')
legend('sim','exp')

    
