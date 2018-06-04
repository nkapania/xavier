%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% finds the maximum velocity, Vmax, that can be achieved by  a car while
% accelerating at Vdot m/s^2.  The cars paramters are given by a, b, hcg,
% m, and D.  mu is the fricton between the tires and road while fv2, g,
% mv2, and mvdot describe the path.  This is now a vectorized computation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Vmax,Vdot] = CalcVmax(Vdot,veh,mu,fv2,g,mv2,mvdot)

    a = veh.a;
    b = veh.b;
    L = a+b;    % wheelbase, [m]
    m = veh.m;
    D = veh.D;
    hcg = veh.h;
    
    beta = 2;   % ratio of front to rear wheel torques
    % may need to reexamine this to decide if it needs to be different for
    % braking and driving

    % terms in constraint equation
    g1 = g(1,:); g2 = g(2,:); g3 = g(3,:);
    fv22 = fv2(2,:); fv23 = fv2(3,:);
    mv22 = mv2(1,:); mv23 = mv2(2,:);
    mvdot2 = mvdot(1,:); mvdot3 = mvdot(2,:);

    %front wheels
    % find terms for V^2 equation
    g = beta*D/(1 + beta);
    h = beta*(m*g1 + m*Vdot)/(1+beta);
    c =  (b*m*fv22 + mv23)/L;
    d = (b*m*g2 + mvdot3.*Vdot)/L;
    e =  (m*b*fv23 - mv22 - hcg*D)/L;
    f = (m*b*(g3) - hcg*(m*(g1 + Vdot)) - mvdot2.*Vdot )/L;

    A = (g).^2 + (c).^2 - mu.^2.*(e).^2;
    B = 2*((g).*(h) + (c).*(d) - mu.^2.*(e).*(f));
    C = (h).^2 + (d).^2 - mu.^2.*(f).^2;

    % use positive solution to quadratic eqn.
    Vmaxf = sqrt((-B + sqrt(B.^2 - 4*A.*C))./(2*A));

    nonReal = logical(real(Vmaxf) ~= Vmaxf);
    noFricLim = nonReal & (A < 0) & (B < 0);
    Vmaxf(noFricLim) = 200; % where friction doesn't matter, keep speeds reasonable
    Vmaxf(nonReal & ~noFricLim) = 0; % something is wrong, stop car

    % do rear wheels
    mu = mu*1.05; % encodes the steady state understeer of the car
    g = D/(1+beta);
    h = m*(g1+Vdot)/(1+beta);
    c = (a*m*fv22 - mv23)/L;
    d = (a*m*g2 - mvdot3.*Vdot)/L;
    e = (m*a*fv23 + mv22 + hcg*D)/L;
    f = (m*a*(g3) + hcg*m*(g1 + Vdot) + mvdot2.*Vdot )/L;

    A = (g).^2 + (c).^2 - mu.^2.*(e).^2;
    B = 2*((g).*(h) + (c).*(d) - mu.^2.*(e).*(f));
    C = (h).^2 + (d).^2 - mu.^2.*(f).^2;

    Vmaxr = sqrt((-B + sqrt(B.^2 - 4*A.*C))./(2*A));

    nonReal = logical(real(Vmaxr) ~= Vmaxr);
    noFricLim = nonReal & (A < 0) & (B < 0);
    Vmaxr(noFricLim) = 200; % where friction doesn't matter, keep speeds reasonable
    Vmaxr(nonReal & ~noFricLim) = 0; % something is wrong, stop car

    Vmax = min(Vmaxf,Vmaxr);
    Vmax = min(Vmax,200);
    
end