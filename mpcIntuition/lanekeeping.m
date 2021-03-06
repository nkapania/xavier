function [y, t, x, deltaFB] = lanekeeping(veh, Ux, tMax, e0)

%lk controller from nkapania thesis, control input is curvature, states are
%[e, dPsi, r, beta]

t = linspace(0, tMax, 1000);

Cf = veh.Cf;
Cr = veh.Cr;
a = veh.a;
b = veh.b;
Iz = veh.Iz;
kp = veh.kLK;
L = veh.L;
xLA = veh.xLA;
m = veh.m;
Kug = veh.FzF/Cf - veh.FzR/Cr;
g = 9.81;
Gffw = (L+Kug*Ux^2/g);

A = [0 Ux 0 Ux; 0 0 1 0; -a*kp*Cf/Iz -a*kp*xLA*Cf/Iz -(a^2*Cf + b^2*Cr)/(Ux*Iz) (b*Cr - a*Cf)/Iz; -kp*Cf/(m*Ux) -kp*xLA*Cf/(m*Ux) (b*Cr-a*Cf)/(m*Ux^2)-1 -(Cf+Cr)/(m*Ux)];
B = [0 -Ux a*Cf*Gffw/Iz Cf*Gffw/(m*Ux)]';
C = [1 0 0 0];
D = 0;

sys = ss(A, B, C, D);


u = zeros(size(t)); %no curvature, we are simulating a straight line
x0 = [e0; 0; 0; 0];

[y,t,x] = lsim(sys, u, t, x0);

e = x(:,1);
dPsi = x(:,2);

deltaFB = -kp*(e + xLA*dPsi); 

end