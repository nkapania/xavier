clear all; close all; clc; 
ts = 0.1; %time step
tf = 5; %simulate for tf seconds
t = 0:ts:tf; %time array
N = length(t);
%N = 25; 
xP = 20; %desired stopping location, meters

%arrays
s = zeros(N,1); s(1) = 0; %position
Ux = zeros(N,1); Ux(1) = 10.0; %initial velocity, m/s
dUx = zeros(N,1); %acceleration
Fx = zeros(N,1); %force
AxFFW = zeros(N,1); %feedback force, assume zero for now

%physical parameters
m = 1500; %passenger vehicle mass
frr = 250; %rolling resistance
dragCoeff = 0.7; %v^2 drag
nt = 30; 

%precompute MPC params to save execution time
U = zeros(nt-1, N);
Sopt = zeros(nt, N);
UxOpt = zeros(nt, N);
slack1 = zeros(1, N);
slack2 = zeros(1, N);

%bounds on u
uBounds = [-5 0.1];

for i = 1:N-1
    x0 = [s(i); Ux(i)];
    [ax, U(1:nt-1,i), Sopt(1:nt,i), UxOpt(1:nt,i), slack1(i), slack2(i)] = getFxMPC(m, ts, nt, x0, xP, uBounds, AxFFW(i), Ux(1)); %also store the solution vector
    Fx(i) = ax*m;
    dUx(i) = (Fx(i) - frr - dragCoeff*Ux(i)^2) / m;
    
    Ux(i+1) = Ux(i) + ts * dUx(i);
    if (Ux(i+1) < 0)
        Ux(i+1) = 0;
    end
    s(i+1)  = s(i)  + ts * Ux(i); 
    
end

%%
subplot(2,1,1)
plot(t(1:N), Ux);
ylabel('Ux m/s')

subplot(2,1,2);
plot(t(1:N), s);
ylabel('s (m)')
xlabel('t (sec)')
ylim([0 xP])
hold on;
plot([0 t(end)], [xP xP],'r');

figure;
plot(t(1:N), dUx);
xlabel('t (sec)');
ylabel('Accel');

figure;
plot(U);
figure;
plot(Sopt);
figure
plot(UxOpt);

figure;
plot(slack1);