function [Fy zeta] = coupledTireForces(alpha, Fx, mu_peak, mu_slide, C, Fz)

if (mu_peak*Fz)^2 > Fx^2
    zeta = sqrt((mu_peak*Fz)^2-Fx^2)/(mu_peak*(Fz));
else
    zeta = 0;
end

if imag(zeta)~=0
    zeta = 0;
end

alpha_slide = abs( atan(3*zeta*mu_peak*Fz/C) );

    if abs(alpha) < alpha_slide % Not slide, use Fiala equations
        Fy = -C*tan(alpha)+(C)^2/(3*zeta*mu_peak*Fz)...
            *(2-mu_slide/mu_peak)*abs(tan(alpha))*tan(alpha)-...
            (C)^3/(9*(mu_peak)^2*(zeta*Fz)^2)*(tan(alpha))^3*(1-2*mu_slide/(3*mu_peak) );
    else    % Sliding on the surface
        Fy = -zeta*mu_slide*Fz*sign(alpha);
    end
    
end