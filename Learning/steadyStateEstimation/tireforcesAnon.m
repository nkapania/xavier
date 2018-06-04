function res = tireforcesAnon(alpha,C, mu, Fz, FyD)

    alpha_slide = abs( atan(3*mu*Fz/C) );

    if abs(alpha) < alpha_slide % Not slide, use Fiala equations
        Fy = -C*tan(alpha)+(C)^2/(3*mu*Fz)*(2-mu/mu)*abs(tan(alpha))*tan(alpha)-...
            (C)^3/(9*(mu)^2*(Fz)^2)*(tan(alpha))^3*(1-2*mu/(3*mu) );
    else    % Sliding on the surface
        Fy = -mu*Fz*sign(alpha);
    end
    
    res = Fy - FyD;
    
end