
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% finds the deceleration achievable by the rear tires and the front/rear
% weight disribution beta.  Parameter usage is consistent with previous
% examples.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [vdot,beta] = DecelRear(Vsquared,g,fv2,mv2,mvdot,mu,beta,a,b,D,hcg,m,brakeFactor)
D = 0; % to see effect of ignoring drag
L = a+b;
% find maximum deceleration assuming back wheels limit
g1 = g(1);
g2 = g(2);
g3 = g(3);
fv22 = fv2(2);
fv23 = fv2(3);
mv22 = mv2(1);
mv23 = mv2(2);
mvdot2 = mvdot(1);
mvdot3 = mvdot(2);

g = m/(1 + beta);
h = (m*g1 + D*Vsquared)/(1+beta);
c = -mvdot3/L;
d = (a*m*(fv22*Vsquared + g2) - mv23*Vsquared)/L;
e = (m*hcg + mvdot2)/L;
f = (m*a*(fv23*Vsquared+g3) + hcg*(m*g1 + D*Vsquared) + mv22*Vsquared)/L;
A = (g)^2 + (c)^2 - mu^2*(e)^2;
B = 2*((g)*(h) + (c)*(d) - mu^2*(e)*(f));
C = (h)^2 + (d)^2 - mu^2*(f)^2;


% use negative solution
vdot = (-B - sqrt(B^2 - 4*A*C))/(2*A) ;%* brakeFactor;
if (~isreal(vdot) || (vdot > 0))
    vdot = -h/g;   % if limits exceeded, grade and drag only;
end
%vdot = vdot - 255.57/m; % rolling resistance
Fzr = e*vdot + f;
Fzf = m*(fv23*Vsquared + g3) - Fzr;
beta = Fzf/Fzr;
vdot = vdot*brakeFactor;
end