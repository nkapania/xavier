clear all; close all; clc;
load('C:\Users\ddl\Documents\localTestData\December2013\fullauto09_HL_2013-12-17_ab')
start = 5500;
fin = 8000;
T = start:fin;


a = 1.0441;
b = 1.4248;

L = a+b;
g = 9.81;


mEst = 1512.4;
%mAct = mEst*.9;
mAct = mEst;

CfEst = 160000;
CrEst = 180000;
%CfAct = CfEst*1.1;
%CrAct = CrEst*1.1;
CfAct = CfEst;
CrAct = CrEst;

muPest = 1;
muSest = 1;
muPact = muPest*1;
muSact = muSest*1;

FzFest = mEst/L*(b*g);
FzRest = mEst/L*(a*g);
FzFact = mAct/L*(b*g);
FzRact = mAct/L*(a*g);

xLA = 15.2;
kLK = .0532;

IzEst = mEst*a*b;
IzAct = mAct*a*b;

ts = .005;

N = numel(T);
s = zeros(N,1);
e = zeros(N,1);
dPsi = zeros(N,1);
FyFFW = zeros(N,1);
Uy = zeros(N,1);
r  = zeros(N,1);
beta = zeros(N,1);
betaFFW = zeros(N,1);

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

load map
getFFWLookupTables


h = waitbar(0,'Simulating...');

for i = 1:(N-1)
    
    waitbar(i/N)
    
    K = interp1(sData, kData, s(i));
    
    FyFdes(i) = b/L*mEst*Ux(i)^2*K;
    FyRdes(i) = a/b*FyFdes(i);
    alphaFdes(i) = interp1(FyFest, alphaFrontEst, FyFdes(i),'linear',-max(alphaFrontEst)*sign(FyFdes(i)));
    alphaRdes(i) = interp1(FyRest, alphaRearEst, FyRdes(i),'linear',-max(alphaRearEst)*sign(FyRdes(i)));
    deltaFFW(i) = K*L +alphaRdes(i) - alphaFdes(i);
    
    
    beta(i) = atan(Uy(i)/Ux(i));
    betaFFW(i) = alphaRdes(i) + b*K;
    %deltaFB(i) = -kLK*e(i) - kLK*xLA*sin(dPsi(i));
    %deltaFB(i) = -kLK*e(i) - kLK*xLA*sin(dPsi(i) + beta(i));
    deltaFB(i) = -kLK*e(i) - kLK*xLA*sin(dPsi(i) + betaFFW(i));
    delta(i) = deltaFB(i) + deltaFFW(i);
    
    alphaF(i) = atan((Uy(i) + a*r(i))/Ux(i)) - delta(i);
    alphaR(i) = atan((Uy(i) - b*r(i))/Ux(i));
     FyF(i) = tireforces(CfAct, muPact, muSact, alphaF(i), FzFact);
     
%      if s(i) > 280 && s(i) < 300
%         FyR(i) = tireforces(Cr, .85, .85, alphaR(i), FzR);
%      else
         FyR(i) = tireforces(CrAct, muPact+.05, muSact+.05, alphaR(i), FzRact);
%      end
    
    dUy = (FyF(i) + FyR(i))/mAct - r(i)*Ux(i);
    dr = (a*FyF(i) - b*FyR(i))/IzAct;
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
plot(t(T), (dPsi + 0)*180/pi,'r');
plot(t(T), e + xLA*sin(dPsi+0),'k');
xlabel('t sec')
ylabel('error')
legend('e','dPsi','eLA')

    
