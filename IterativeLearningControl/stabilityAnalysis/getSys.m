function [sys] = getSys(Ux, ts)

a = 1.0441; b = 1.4248; m = 1.5124e+003; Cf = 160000; Cr = 180000; g = 9.81; L = a+b; Iz = 2.2499e+003;
xLA = 15.2; kLK = .0532;

c0 = Cf+Cr; c1 = a*Cf-b*Cr; c2 = a^2*Cf+b^2*Cr;
A1 = [-c0/(m*Ux) -c1/(m*Ux^2)-1;-c1/Iz -c2/(Iz*Ux)];
A = [ [0 Ux Ux 0; 0 0 0 1] ; [zeros(2) A1] ];

Bd = [0; 0; Cf/(m*Ux); a*Cf/Iz];

K = [kLK kLK*xLA 0 0];

A = A-Bd*K;
C = [1 0 0 0];

sys = ss(A,Bd,C,0);
sys = c2d(sys,ts);


end