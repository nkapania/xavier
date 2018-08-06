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
t = linspace(0, tMax, 1000);
dt = t(2) - t(1);

yMPC = zeros(size(t));
xMPC = zeros(4, len(t)); 
deltaMPC = zeros(size(t)); 


[xSolved, deltaSolved] = mpcHelperFcn(A, B, x0, N, R); %run first MPC iteration


counter = 0;
xMPC(:,1) = x0;
yMPC(1) = e0;
deltaMPC(1) = deltaSolved(1); %apply first input in receding horizon fashion

for i = 2:len(t)
    
    %calculate input - don't do this every time step because MPC is slow
    if counter < ts
        counter = counter + dt; %only solve mpc problem every ts seconds
        deltaMPC(i) = deltaMPC(i-1);
    else
        counter = 0; %reset counter
        [xSolved, deltaSolved] = mpcHelperFcn(A, B, xMPC(:,i-1), N, R);
        deltaMPC(i) = deltaSolved(1); %apply first input in recreding horizon fashion
    end
    
    %update state
    dxdt = Ac * xMPC(:,i-1) + Bc * deltaMPC(i);
    xMPC(:,i) = xMPC(:,i) + dxdt * dt; 
    yMPC(i) = xMPC(1,i);
    
end
    
    
    
    














