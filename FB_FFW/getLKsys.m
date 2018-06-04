%Nitin Kapania
%This function outputs either state matrices or a transfer function for a
%linear lanekeeping system, with either curvature as input or delta as
%input.

function [E DP R B ELA] = linearLKanalysis(Ux,mode)

a = 1.0441; b = 1.4248; m = 1.5124e+003; Cf = 160000; Cr = 180000; g = 9.81; L = a+b; Iz = 2.2499e+003;
xLA = 15.2; kLK = .0532; 
FzF = m/L*(b*g); FzR = m/L*(a*g); Kug = FzF/Cf - FzR/Cr;

%mass matrix
M = [1/Ux 0 0 0; 0 1 0 0; 0 0 Iz 0; 0 0 0 m*Ux];


if strcmp(mode,'lk') == 1    %curved road
    A1 = [0 1 0 1; 0 0 1 0; 
            -kLK*a*Cf -kLK*xLA*a*Cf (-a^2*Cf - b^2*Cr)/Ux (b*Cr-a*Cf);
            -kLK*Cf   -kLK*xLA*Cf   (b*Cr-a*Cf)/Ux-m*Ux  -Cf-Cr];
    B1 = [0; 0; a*Cf; Cf]*(L + Kug*Ux^2/g) +  [0; -Ux; 0; 0];
elseif strcmp(mode,'beta') == 1
    A1 = [0 1 0 1; 0 0 1 0; 
        -kLK*a*Cf -kLK*xLA*a*Cf (-a^2*Cf - b^2*Cr)/Ux (b*Cr-a*Cf - a*kLK*xLA*Cf);
        -kLK*Cf   -kLK*xLA*Cf   (b*Cr-a*Cf)/Ux-m*Ux  -Cf-Cr-kLK*xLA*Cf];
    B1 = [0; 0; a*Cf; Cf]*(L + Kug*Ux^2/g) +  [0; -Ux; 0; 0];
elseif strcmp(mode,'betaFFW') == 1
    A1 = [0 1 0 1; 0 0 1 0; 
            -kLK*a*Cf -kLK*xLA*a*Cf (-a^2*Cf - b^2*Cr)/Ux (b*Cr-a*Cf);
            -kLK*Cf   -kLK*xLA*Cf   (b*Cr-a*Cf)/Ux-m*Ux  -Cf-Cr];
    B1 = [0; 0; a*Cf; Cf]*(L + m*Ux^2/L*(b/Cf - a*(1-kLK*xLA)/Cr) - kLK*xLA*b) +  [0; -Ux; 0; 0];
else
    error('pick a type')
end

A = inv(M)*A1;
B = inv(M)*B1;
C = [eye(4); [1 xLA 0 0]];

[num,den] = ss2tf(A, B, C,zeros(5,1));
E   = tf(num(1,:),den);
DP  = tf(num(2,:),den);
R   = tf(num(3,:),den);
B   = tf(num(4,:),den);
ELA = tf(num(5,:),den);

end