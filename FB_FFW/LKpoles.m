function [p Kug] = LKpoles(mode, Ux, a, b, Cf, Cr, kLK, xLA)

if nargin < 8, xLA = 15.2; end
if nargin < 7, kLK = .0532; end
if nargin < 6, Cr = 180000; end
if nargin < 5, Cf = 160000; end
if nargin < 4, b = 1.4248; end
if nargin < 3, a = 1.0441; end
if nargin < 2, Ux = 10; end
if nargin < 1, mode = 'lk'; end


m = 1.5124e+003;
 Iz = 2.2499e+003; g = 9.81; L = a+b;
FzF = m/L*(b*g); FzR = m/L*(a*g); Kug = FzF/Cf - FzR/Cr;

%% curved road
  
if strcmp(mode,'lk') == 1
    M = [1/Ux 0 0 0; 0 1 0 0; 0 0 Iz 0; 0 0 0 m*Ux];
    A1 = [0 1 0 1; 0 0 1 0; 
    -kLK*a*Cf -kLK*xLA*a*Cf (-a^2*Cf - b^2*Cr)/Ux (b*Cr-a*Cf);
    -kLK*Cf   -kLK*xLA*Cf   (b*Cr-a*Cf)/Ux-m*Ux  -Cf-Cr];
elseif strcmp(mode,'beta') == 1 || strcmp(mode,'betaFFW' == 1)
    M = [1/Ux 0 0 0; 0 1 0 0; 0 0 Iz 0; 0 0 0 m*Ux];
    A1 = [0 1 0 1; 0 0 1 0; 
    -kLK*a*Cf -kLK*xLA*a*Cf (-a^2*Cf - b^2*Cr)/Ux (b*Cr-a*Cf - a*kLK*xLA*Cf);
    -kLK*Cf   -kLK*xLA*Cf   (b*Cr-a*Cf)/Ux-m*Ux  -Cf-Cr-kLK*xLA*Cf];
else
    error('You Suck')
end
    A = inv(M)*A1;
    p = eig(A);
end