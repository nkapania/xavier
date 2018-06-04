function [posDesired, UxDesired, AxDesired, AxMax] = IntegrateForwardForSegment(step,posDesired,UxDesired, AxDesired,veh,mu, fv2,g,mv2,mvdot,theta,x_0)

    a = veh.a; b = veh.b; h = veh.h; m = veh.m; D = veh.D; 

    n = length(posDesired);
%     Vsquared = x_0(1)^2; % UxDesired(1)^2;
    Vsquared =   UxDesired(1)^2;
    beta = 2;
    AxMax = zeros(1,length(AxDesired));
    for i = 1:n
        UxDesired(i) = sqrt(Vsquared);

        % find limits on front and rear tires and max speed
        [axF,betaF] = AccelFront(Vsquared,g(:,i),fv2(:,i),mv2(:,i),mvdot(:,i),mu(i),beta,a,b,D,h,m);
        [axR,betaR] = AccelRear(Vsquared,g(:,i),fv2(:,i),mv2(:,i),mvdot(:,i),mu(i),beta,a,b,D,h,m);

        % take smaller magnitude and corresponding torque proportioning
        if (axF > axR)
            ax = axR;
            beta = betaR;
        else
            ax = axF;
            beta = betaF;
        end

        AxMax(i) = ax;     % save for later

        P = veh.powerLimit; % engine power, [W]
        ax = min(ax,P/m/sqrt(Vsquared)-0.7*Vsquared/m -g(1,i))-300/m;

        % update and avoid royally screwing up
        Vsquared = Vsquared + 2*step*ax/cos(theta(i));
        if (Vsquared < 0)
            Vsquared = 0;
            ax = 0;
        end

        % avoid overshooting your brakepoints
        if i < n
            if sqrt(Vsquared) > UxDesired(i+1);
                Vsquared = UxDesired(i+1)^2;
                ax = (UxDesired(i+1)^2 - UxDesired(i)^2)/(2*(posDesired(i+1) - posDesired(i)));
            end
        else
            if sqrt(Vsquared) > UxDesired(1);
                Vsquared = UxDesired(1)^2;
                ax = (UxDesired(1)^2 - UxDesired(i)^2)/(2*(posDesired(1) - posDesired(i)));
            end
        end

        AxDesired(i) = ax;
     
    end 

end