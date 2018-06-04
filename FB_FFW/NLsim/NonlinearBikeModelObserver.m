clear all; close all; clc;
%load('C:\Users\ddl\Documents\localTestData\November2013\mu5basent_HL_2013-11-25_aa')
load('C:\Users\ddl\Documents\localTestData\Sept2013\rampUpMu9')

start = 6000;
fin= 8300;
Cf = 160000; Cr = 180000;
muPf = 1.2; muSf = 1.0;
muPr = 1.25; muSr = 1.05;

muFFW = .925;
%delta = TTSdata.roadWheelAngle(T);



%%

T = start:fin;
t = t(T);

Ux = ApplanixData.vxCG(T);
Uy0 = ApplanixData.vxCG(start)*tan(ApplanixData.sideSlip(start));
r0 = ApplanixData.yawRate(start);

a = 1.0441; b = 1.4248; m = 1.5124e+003; L = a+b; g = 9.81; FzF = m/L*(b*g); FzR = m/L*(a*g); xLA = 15.2; kLK = .0532; Iz = 2.2499e+003; ts = .005;
N = numel(T);

s = zeros(N,1); e = zeros(N,1); dPsi = zeros(N,1); FyFFW = zeros(N,1); Uy = zeros(N,1);
UySim = zeros(N,1); rSim = zeros(N,1);
r  = zeros(N,1); alphaF = zeros(N,1); alphaDesired = zeros(N,1); alphaR = zeros(N,1);

delta = zeros(N,1); deltaFFW = zeros(N,1);deltaFB = zeros(N,1); s(1) = mapMatch.dstAlongPath(start); e(1) = mapMatch.e(start);
dPsi(1) = mapMatch.deltaPsi(start); Uy(1) = Uy0; r(1) = r0;

sData = mapMatch.dstAlongPath(T);
kData = mapMatch.curvature(T);

for i = 1:(N-1)
    
    K = interp1(sData, kData, s(i));
    
    [deltaFFW(i) alphaDesired(i) UySim(i) rSim(i)] = getDeltaFFW(Ux(i), 0, Uy(i), r(i), K, 0, .005, muFFW);    
    deltaFB(i) = -kLK*(e(i) + xLA*sin(dPsi(i)));
    delta(i) = deltaFFW(i) + deltaFB(i);
    
    alphaF(i) = atan((Uy(i) + a*r(i))/Ux(i)) - delta(i);
    alphaR(i) = atan((Uy(i) - b*r(i))/Ux(i));
    FyF(i) = tireforces(Cf, muPf, muSf, alphaF(i), FzF);
    FyR(i) = tireforces(Cr, muPr, muSr, alphaR(i), FzR);
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



%%
figure; plot(ApplanixData.yawRate)
hold on;
plot([start start],[-.5 .5],'r','LineWidth',2)
plot([fin fin],    [-.5 .5],'r','LineWidth',2)

figure
plot(t, Uy,'LineWidth',2);
hold on;
plot(t, tan(ApplanixData.sideSlip(T)).*Ux,'r','LineWidth',2);
plot(t, UySim,'b--')
plot(t, HLsteering.UySim(T),'r--')
grid on
xlabel('t (sec)')
ylabel('Uy (m/s)')
legend('Sim','Thunder Hill')

figure;
plot(t, r,'LineWidth',2);
hold on;
plot(t, ApplanixData.yawRate(T),'r','LineWidth',2);
plot(t, rSim,'b--')
plot(t, HLsteering.rSim(T),'r--')
grid on
xlabel('t (sec)')
ylabel('yaw rate (rad/s)')
legend('Sim','Thunder Hill')

figure;
plot(t, delta*180/pi, 'LineWidth',2)
hold on; grid on;
plot(t, TTSdata.roadWheelAngle(T)*180/pi,'r','LineWidth',2)
xlabel('t (sec)')
ylabel('delta (deg)')
legend('Sim','Thunder Hill')

figure; 
plot(t, alphaF*180/pi,'LineWidth',2);
hold on; grid on;
plot(t, tireSlip.alphaFront(T)*180/pi,'r','LineWidth',2)
plot(t, alphaDesired*180/pi,'b--','LineWidth',2)
xlabel('t (sec)')
ylabel('Front Alpha (deg)')
legend('Sim','Thunder Hill')

figure;
plot(t, alphaR*180/pi,'LineWidth',2);
hold on; grid on;
plot(t, tireSlip.alphaRear(T)*180/pi,'r','LineWidth',2)
xlabel('t sec')
ylabel('alphaR')
legend('Sim','Thunder Hill')

figure;
plot(t, e);
hold on;
plot(t, dPsi*180/pi,'r');
plot(t, e + xLA*sin(dPsi),'k');
hold on; grid on;
plot(t, mapMatch.e(T),'b--')
plot(t, mapMatch.deltaPsi(T)*180/pi,'r--')
plot(t, calc.e_la(T),'k--')
xlabel('t sec')
ylabel('error')
legend('sim','exp')


