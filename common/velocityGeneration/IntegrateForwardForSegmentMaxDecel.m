function [posDesired, UxDesired, AxDesired, AxMax] = IntegrateForwardForSegmentMaxDecel(step,posDesired,UxDesired, AxDesired,veh,mu, fv2,g,mv2,mvdot,theta,brakeFactor,x_0)

%figure(5),hold on, plot(UxDesired,'k.'), shg

    a = veh.a; b = veh.b; h = veh.h; m = veh.m; D = veh.D; 

    n = length(posDesired);
%     Vsquared = x_0(1)^2; % UxDesired(1)^2;
    Vsquared = UxDesired(1)^2;
    beta = x_0(3); % set current beta as start value 
    AxMax = zeros(1,length(AxDesired));
    for i = 1:n
        UxDesired(i) = sqrt(Vsquared);

        % find limits on front and rear tires and max speed
    [axF,betaF] = DecelFront(Vsquared,g(:,i),fv2(:,i),mv2(:,i),mvdot(:,i),mu(i),beta,a,b,h,m,brakeFactor);
    [axR,betaR] = DecelRear(Vsquared,g(:,i),fv2(:,i),mv2(:,i),mvdot(:,i),mu(i),beta,a,b,D,h,m,brakeFactor);

        % take smaller magnitude and corresponding torque proportioning
        if (axF > axR)
            ax = axR;
            beta = betaR;
        else
            ax = axF;
            beta = betaF;
        end

        AxMax(i) = ax;     % save for later
        
        
        ax = min(ax,0);

        %P = veh.powerLimit; % engine power, [W]
        %ax = min(ax,P/m/sqrt(Vsquared)-0.7*Vsquared/m -g(1,i))-300/m;

        % update and avoid royally screwing up
        Vsquared = Vsquared + 2*step*ax/cos(theta(i));
        if (Vsquared < 0)
            Vsquared = 0;
            ax = 0;
        end

        % avoid braking too much!
         if i < n
            if (sqrt(Vsquared) < UxDesired(i+1)) % if the calculated spped is lower than the achievable, take the latter
                Vsquared = UxDesired(i+1)^2;
                ax = (UxDesired(i+1)^2 - UxDesired(i)^2)/(2*(posDesired(i+1) - posDesired(i)));
            end
%         else
%             if sqrt(Vsquared) < UxDesired(1);
%                 Vsquared = UxDesired(1)^2;
%                 ax = (UxDesired(1)^2 - UxDesired(i)^2)/(2*(posDesired(1) - posDesired(i)));
%             end
         end

        AxDesired(i) = ax;
        
%        figure(5),hold on, plot(i,sqrt(Vsquared),'ro')
     
    end 

end