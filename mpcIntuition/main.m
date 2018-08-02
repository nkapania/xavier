close all; clear all; clc;
addpath(genpath('/home/nkapania/xavier/common'))

veh = getVehicle('linear','closest');
%% LK controller - simulate with lsim
Ux = 20; tMax = 5; e0 = 2; 
[yLK, t, xLK, delta] = lanekeeping(veh, Ux, tMax, e0);


%% LQR
[yLQR, t, xLQR, deltaLQR] = mylqr(veh, Ux, tMax, e0);


%% MPC unconstrained
[yLQR, t, xLQR, deltaLQR] = mympc(veh, Ux, tMax, e0);


%% MPC constrained


%% plot results

plot(t, yLK);
hold on; 
plot(t, yLQR, 'r--')
xlabel('time (s)');
ylabel('Lateral Error e (m)')
legend('Lanekeeping','LQR')

figure;
plot(t, delta*180/pi);
hold on;
plot(t, deltaLQR*180/pi, 'r--'); 
xlabel('time (s)')
ylabel('Steer Input (deg)')
legend('Lanekeeping','LQR')
