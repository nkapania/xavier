close all; clear all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));

%path = genWorldFromCSV('C:\Mapping\Maps\SCFG Paved\shakedownMap.csv');
%path = genWorldFromCSV('C:\Mapping\Maps\Thunderhill\thunderhill_race.csv');
path = genWorldFromSK([0 75 150 225 300 375 450 525 600 675], [0 0 .03 .03 0 0 -.02 -.02 0 0]); 
path.isOpen = 0; %make closed so we still have nonzero velocity at end of map.

veh = getVehicle('nonlinear','closest');
%%
mu = .95; ts = .005;
vp = getVelocityProfile(path, veh, mu);
%vp = getConstantVP(path, 17);

%N = 8;
N = 5;

[SIM_PD, ILC_PD]  = ILCbikeSim(path, veh, ts, vp, N, 'PD');
[SIM_QS,  ILC_QS] = ILCbikeSim(path, veh, ts, vp, N, 'Q_SISO');
[SIM_QM,  ILC_QM] = ILCbikeSim(path, veh, ts, vp, N, 'Q_MIMO');
%[SIM_CVX, ILC_CVX] = ILCbikeSim(path, veh, ts, vp, N, 'CVX');

%%
% close all; figure
% plot(SIM_PD.t, SIM_PD.alphaFdes*180/pi)
% hold on;
% plot(SIM_PD.t, SIM_PD.alphaF*180/pi,'r')
% plot(SIM_PD.t(ind), SIM_PD.alphaF(ind)*180/pi,'g*')
% plot(SIM_PD.t, SIM_PD.e*10, 'k')


%%
close all;
figure; hold on;
xlabel('Iteration Number')
ylabel('E_RMS(m)')
for i = 1:N
    plot(i, SIM_PD(i).eRMS,'k*');
    hold on;
    plot(i, SIM_QS(i).eRMS,'r*');
    plot(i, SIM_QM(i).eRMS,'b*');
    legend('PD', 'Q-SISO', 'Q_MIMO');
end

figure; hold on;
xlabel('Iteration Number')
ylabel('V_RMS(m)')
for i = 1:N
    plot(i, SIM_PD(i).vRMS,'k*');
    hold on;
    plot(i, SIM_QS(i).vRMS,'r*');
    plot(i, SIM_QM(i).vRMS,'b*');
    legend('PD', 'Q-SISO', 'Q_MIMO');
end

run = 5;

figure;
xlabel('s (m)')
ylabel('\delta_{ILC} (deg)')
plot(ILC_PD(run).s, ILC_PD(run).d*180/pi,'k');
hold on;
plot(ILC_QS(run).s, ILC_QS(run).d*180/pi,'r')
plot(ILC_QM(run).s, ILC_QM(run).d*180/pi)
legend('PD', 'Q-SISO', 'Q-MIMO');

figure;
xlabel('s (m)')
ylabel('Fx_{ILC} (N)')
plot(ILC_PD(run).s, ILC_PD(run).f,'k');
hold on;
plot(ILC_QS(run).s, ILC_QS(run).f,'r')
plot(ILC_QM(run).s, ILC_QM(run).f)
legend('PD', 'Q-SISO', 'Q-MIMO');

%%
close all
figure; 
xlabel('s (m)')
ylabel('Fx_ILC(N)')
c = ['r' 'g' 'b' 'c' 'k'];
for i = 1:N
    plot(SIM_QM(i).s, SIM_QM(i).FxILC,c(i));
    hold on;
end