function [Fy, zeta] = coupledTireForces(alpha, Fx, veh, tire)

if strcmp(tire, 'front')
    Fz = veh.FzF;
    muP = veh.muF;
    muS = veh.muF;
    C   = veh.Cf;
elseif strcmp(tire, 'rear')
    Fz = veh.FzR;
    muP = veh.muR;
    muS = veh.muR;
    C  =  veh.Cr;
else
    error('front or rear tire only')
end

if (muP*Fz)^2 > Fx^2
    zeta = sqrt((muP*Fz)^2-Fx^2)/(muP*(Fz));
else
    zeta = 0;
end

if imag(zeta)~=0
    zeta = 0;
end

alphaSlide = abs( atan(3*zeta*muP*Fz/C) );

    if abs(alpha) < alphaSlide % Not slide, use Fiala equations
        Fy = -C*tan(alpha)+(C)^2/(3*zeta*muP*Fz)...
            *(2-muS/muP)*abs(tan(alpha))*tan(alpha)-...
            (C)^3/(9*(muP)^2*(zeta*Fz)^2)*(tan(alpha))^3*(1-2*muS/(3*muP) );
    else    % Sliding on the surface
        Fy = -zeta*muS*Fz*sign(alpha);
    end
    
end