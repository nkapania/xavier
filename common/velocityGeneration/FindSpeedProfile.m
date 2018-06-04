% Finds a minimum time trajectory for a given 3D path.
%   sigma is a row vector of EQUIDISTANT positions along the path to which the other
%   values correspond.  Fv2, G, Mv2, and Mvdot are the force, gravity,  and
%   momtent coefficints associated with those positions (size 3 x n).
%   jerkLimit is the rate at which the brakes can be released to limit
%   understeer.  Handles open and closed paths according to the information
%   in path.  brakeFactor is the percentage of max g that is used in
%   pure braking. 

function [ posDesired, UxDesired, AxDesired, AxMax] = FindSpeedProfile(path, veh, mu, Vmax, sigma,...
    Fv2,G,Mv2,Mvdot,theta,jerkLimit, brakeFactor)


    n = length(sigma); % number of sample points
    AxDesired = zeros(1,n); % feedforward acceleration
    Vmax = Vmax*ones(1, n);
    mu   = mu  *ones(1, n);

    % handle the open maps by limiting the final speed to zero for last 10 m
    if path.isOpen
        stoppedPoints = ( sigma >= (sigma(end) - 10) );
        Vmax(stoppedPoints) = 0;
    else % remove last point to prevent double counting/duplication
        % this is probably the cleanest way to do it to avoid extra logic later
        endPoint = sigma(n);
        sigma = sigma(1:n-1);
        Fv2 = Fv2(:,1:n-1);
        G = G(:,1:n-1);
        Mvdot = Mvdot(:,1:n-1);
        Mv2 = Mv2(:,1:n-1);
        theta = theta(1:n-1);
        AxDesired = AxDesired(1:n-1);
        Vmax      = Vmax(1:n-1);
        mu        = mu  (1:n-1);
    end

    % find velocity max based on pointwise friction constraint
    UxDesired = min(Vmax,CalcVmax(0, veh, mu,Fv2,G,Mv2(2:3,:),Mvdot(2:3,:))); % target speed
    UxCoast = min(Vmax,CalcVmax(-G(1,:), veh,mu,Fv2,G,Mv2(2:3,:),Mvdot(2:3,:))); % achievable speed when all friction used for cornering
    speedLim = UxDesired;   % cannot be exceeded


    if ~path.isOpen
        speedLim = DoSomeCoasting(sigma,UxCoast,UxDesired,theta,G,veh.D,veh.m);
    end

    [posDesired,UxDesired,AxDesired,AxMax] = GenerateSpeedProfile(speedLim,AxDesired,veh,mu,sigma,Fv2,G,Mv2,Mvdot,theta, jerkLimit,brakeFactor);

    % close the loop and ensure continuity
    if ~path.isOpen
        posDesired = [posDesired endPoint];
        UxDesired = [UxDesired UxDesired(end)];
        AxDesired = [AxDesired AxDesired(end)];
        AxMax = [AxMax AxMax(1)];
    else % set desired acceleration to the negitive limit so that the car stops and continues braking.
        AxDesired(stoppedPoints) = -mu(stoppedPoints)*9.81;
    end


end

