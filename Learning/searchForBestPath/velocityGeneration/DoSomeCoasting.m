function speedLim = DoSomeCoasting(sigma,UxCoast,UxDesired,theta,G,D,m)

    n = length(sigma);
    targetSpeedSquared = UxCoast.^2; % initialize this
    AX = zeros(1,n);

    % backwards coasting down the hills
    for i = 0:(n-2)
        step = sigma(n-i) - sigma(n-i-1);
        if theta(n-i - 1) < 0 || UxCoast(n-i) <= UxDesired(n-i) % if uphill or constant speed is faster, skip this point
            continue
        else

            Vmax = max(UxDesired(n-i-1),UxCoast(n-i-1));

            ax = -G(1,n-i-1) - (D*targetSpeedSquared(n-i) - 255.57)/m;
            AX(n-i-1) = ax; % this is for debugging, not actually used for anything
            % update
            targetSpeedSquared(n-i-1) = targetSpeedSquared(n-i) - 2*step*ax/cos(theta(n-i));
            if (targetSpeedSquared(n-i-1) < 0) % should never happen
                targetSpeedSquared(n-i-1) = 0;
            end
            if targetSpeedSquared(n-i-1) > Vmax^2;
                targetSpeedSquared(n-i-1) = Vmax^2; % don't expect this to happpend
            end
            targetSpeedSquared(n-i-1) = max(targetSpeedSquared(n-i-1), UxDesired(n-i-1)^2);
        end
    end

    % forwards coasting and slowing on the uphills
    for i = 1:(n-1)
        step = sigma(i+1) - sigma(i);
        if theta(i) > 0 || UxCoast(i) <= UxDesired(i) % if downhil or constant speed is faster, skip this point
            continue
        else
            Vmax = max(UxDesired(i+1),UxCoast(i+1)); % maybe useful

            ax = -G(1,i) - (D*targetSpeedSquared(i) - 255.57)/m;
            AX(i) = ax;
            % update
            targetSpeedSquared(i+1) = targetSpeedSquared(i) + 2*step*ax/cos(theta(n-i));
            if (targetSpeedSquared(i+1) < 0) % should never happen
                targetSpeedSquared(i+1) = 0;
            end
            if targetSpeedSquared(i+1) > Vmax^2;
                targetSpeedSquared(i+1) = Vmax^2; % don't expect this to happpend
            end
            targetSpeedSquared(i+1) = max(targetSpeedSquared(i+1), UxDesired(i+1)^2);
        end
    end %

    speedLim = max(sqrt(targetSpeedSquared),UxDesired);

end