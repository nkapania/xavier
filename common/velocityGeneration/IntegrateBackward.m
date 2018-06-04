%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finds safe speeds for approaching corners by tracing maximum deceleration
% backwards from the corners.  Returns Ux, the max safe speed, the
% associated Ax and positions.  Takes, a step size, step, the vector length
% n, ax, the acceleration at the slowest point on the map.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [positions, Ux, Ax] = IntegrateBackward(step,n,endSpeed,ax,veh,mu,sigma,...
    fv2,g,mv2,mvdot,theta,jerkLimit,speedLimit,brakeFactor)

a = veh.a; b = veh.b; h = veh.h; m = veh.m; D = veh.D;

positions = sigma;  % distance along the path
Ux = zeros(1,n);    % speed [m/s]
Ax = zeros(1,n);    % acceleration [m/s^2]

Vsquared = endSpeed^2;

beta = 1.5; % ratio of brake torque between front and rear wheels

for i = 0:(n-2)
    Ux(n-i) = sqrt(Vsquared);
    Ax(n-i) = ax;
    
    % find limits on front and rear tires and max speed
    [axF,betaF] = DecelFront(Vsquared,g(:,n-i),fv2(:,n-i),mv2(:,n-i),mvdot(:,n-i),mu(n-i),beta,a,b,h,m,brakeFactor);
    [axR,betaR] = DecelRear(Vsquared,g(:,n-i),fv2(:,n-i),mv2(:,n-i),mvdot(:,n-i),mu(n-i),beta,a,b,D,h,m,brakeFactor);
    Vmax = speedLimit(n-i-1);
    
    % take smaller magnitude and corresponding brake proportioning
    if (axF > axR)
        ax = axF;
        beta = betaF;
    else
        ax = axR;
        beta = betaR;
    end
    
    ax = min(ax,0);
    
    % control how fast we can come off the brakes to limit understeer on
    % entry
    if ((ax-Ax(n-i))/step*sqrt(Vsquared) < -jerkLimit)
        ax = -jerkLimit*step/sqrt(Vsquared) + Ax(n-i);
    end
    
    % update
    Vsquared = Vsquared - 2*step*ax/cos(theta(n-i));
    if (Vsquared < 0) % should never happen
        Vsquared = 0;
        ax = 0;
    end
    if Vsquared > Vmax^2;
        Vsquared = Vmax^2;
        ax = 0;
    end
    
end % end while loop

Ux(1) = sqrt(Vsquared);
Ax(1) = ax;

end