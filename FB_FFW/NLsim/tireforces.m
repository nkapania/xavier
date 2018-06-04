function Fy = tireforces(C,mu_peak,mu_slide,alpha,Fz)
% tireforces, calculate tire force for nonlinear tire model
% Author: Mick
% Date: May 3, 11
%
% Usage: calculate nonlinear tire curve, using Fiala brush model with no
% longitudinal force.  Inputs are
% C is the cornering stiffness per axle (N/rad)
% mu_peak and mu_slide are no slip and slip friction coefficients
% alpha = slip angle (rad)
% Fz = normal load on that axle (N)

alpha_slide = abs( atan(3*mu_peak*Fz/C) );

N=length(alpha);
Fy=zeros(N,1);

for counter=1:N
    if abs(alpha(counter)) < alpha_slide % Not slide, use Fiala equations
        Fy(counter) = -C*tan(alpha(counter))+(C)^2/(3*mu_peak*Fz)...
            *(2-mu_slide/mu_peak)*abs(tan(alpha(counter)))*tan(alpha(counter))-...
            (C)^3/(9*(mu_peak)^2*(Fz)^2)*(tan(alpha(counter)))^3*(1-2*mu_slide/(3*mu_peak) );
    else    % Sliding on the surface
        Fy(counter) = -mu_slide*Fz*sign(alpha(counter));
    end
end







