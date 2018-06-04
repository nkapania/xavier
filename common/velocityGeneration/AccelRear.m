
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% finds the acceleration achievable by the rear tires and the front/rear
% weight disribution beta.  Parameter usage is consistent with previous
% examples.  Air drag and rolling resistance are considered here unlike the
% decceleration case
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [vdot,beta] = AccelRear(Vsquared,g,fv2,mv2,mvdot,mu,beta,a,b,D,hcg,m)

    L = a+b;
    % find maximum acceleration assuming back wheels limit
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


    % use positive solution
    vdot = (-B + sqrt(B^2 - 4*A*C))/(2*A);
    if (~isreal(vdot) || (vdot < 0))
        vdot = -h/g;   % if limits exceeded, grade and drag only;
        vdot = 0; % maybe this is feasible by a different torque dist.
    end

    %vdot = vdot - 255.57/m;
    Fzr = e*vdot + f;
    Fzf = m*(fv23*Vsquared + g3) - Fzr;
    beta = Fzf/Fzr;
    if (beta < 1)
        beta = 1;
    end

end