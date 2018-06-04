%This function does LTV simulation of a lanekeeping system, given the
%feedback type, initial conditions, vehicle parameters, and velocity and curvature input
%signals. Originally designed for the AVEC 2014 conference.

%Nitin Kapania.

function [t e dPsi r beta eLA deltaFFW deltaFB] = LKsimLinear(Karray, UxArray, x0, params, ts)

if nargin < 5, ts = .005; end;
if nargin < 4
    a = 1.04; b = 1.43; m = 1500; Cf = 160000; Cr = 180000; Iz = 2250; kLK = .053; xLA = 15.2;
else
    m = params.TTS.m; a = params.TTS.a; b = params.TTS.b; Cf = params.TTS.Cf; Cr = params.TTS.Cr; Iz = params.TTS.Iz;
    kLK = params.lk.kLK; xLA = params.lk.xLA; 
end
if nargin < 3, x0 = zeros(4,1); end

L = a+b; g = 9.81; FzF = m/L*(b*g); FzR = m/L*(a*g); Kug = FzF/Cf - FzR/Cr;

N = numel(UxArray);  X = zeros(4,N);  X(:,1) = x0;


for i = 1:N-1
    Ux = UxArray(i);
    K = Karray(i); 

    M = [1/Ux 0 0 0; 0 1 0 0; 0 0 Iz 0; 0 0 0 m*Ux];
    A1 = [0 1 0 1; 0 0 1 0; ...
            -kLK*a*Cf -kLK*xLA*a*Cf (-a^2*Cf - b^2*Cr)/Ux (b*Cr-a*Cf);...
            -kLK*Cf   -kLK*xLA*Cf   (b*Cr-a*Cf)/Ux-m*Ux  -Cf-Cr];
        
    B1 = [0; 0; a*Cf; Cf]*(L + Kug*Ux^2/g) +  [0; -Ux; 0; 0];
    
    A = inv(M)*A1; B = inv(M)*B1;

    DX = A*X(:,i)+B*K;
    X(:,i+1) = X(:,i) + ts*DX;

end

e = X(1,:)'; dPsi = X(2,:)'; r = X(3,:)'; beta = X(4,:)';
eLA = e + xLA*dPsi; deltaFFW = (L + Kug*UxArray.^2/g).*Karray; deltaFB = -kLK*eLA;
t = 0:ts:(N-1)*ts;

end