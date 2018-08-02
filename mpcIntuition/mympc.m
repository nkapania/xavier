function [yMPC, t, xMPC, deltaMPC] = mympc(veh, Ux, tMax, e0)

% get A and B matrices
Cf = veh.Cf;
Cr = veh.Cr;
a = veh.a;
b = veh.b;
Iz = veh.Iz;
m = veh.m;

A33 = (-a^2*Cf - b^2*Cr) / (Ux*Iz); 
A34 = (b*Cr - a*Cf)/Iz; 
A43 = (b*Cr - a*Cf)/(m*Ux^2) - 1;
A44 = -(Cf+Cr)/(m*Ux); 

Ac = [0 Ux 0 Ux; 0 0 1 0; 0 0 A33 A34; 0 0 A43 A44];
Bc = [0 0 a*Cf/Iz Cf/(m*Ux)]';

%discretize A and B matrices
ts = 0.1; %seconds
[A, B] = myc2d(Ac, Bc, ts);

%setup convex problem
N = 20; %Horizon length
x0 = [e0; 0 ; 0; 0];
R = 1000;

%simulate:
t = linspace(0, tmax, 1000);
dt = t(2) - t(1);

yMPC = zeros(size(t));
xMPC = zeros(len(t), 4); 
deltaMPC = zeros(size(t)); 


[xSolved, deltaSolved] = mpcHelperFcn(A, B, x0, N, R); %run first MPC iteration


counter = 0;
xMPC(1,:) = 
yMPC(1,:) = 
deltaMPC(1,:) = 

for i = 2:len(t)
    if counter < ts
        counter = counter + dt; %only solve mpc problem every ts seconds
        deltaMPC(i) = 
    else
        counter = 0; %reset counter
        [xSolved, deltaSolved] = mpcHelperFcn(A, B, xMPC(i,:)', N, R);
    end
    
    
    
    














