function [mu, C, E, optval] = minimizeEstimationError(TABLE, Fy, alpha, muHat)
    
    %downsample by a factor of ten to save time
    Fy = Fy(1:10:end); alpha = alpha(1:10:end); 

    M = len(TABLE.mu);  N = len(TABLE.C); P = len(Fy);
    E = zeros(N, M); %matrix of estimation error for each parameter set
    
    for i = 1:N %for each cornering stiffness
        for j = 1:M  %for each mu value
            err = zeros(P,1);
            mu = TABLE.mu(j);
            for k = 1:P %for each data point in the range
                [~, I] = min(abs(Fy(k) - TABLE.Fy*sign(Fy(k)))); %find closest lateral force in table
                    if isnan(TABLE.alpha(i,j,I))  %avoid parameters where mu/cf are too low to generate necessary force
                        TABLE.alpha(i,j,I) = Inf;
                    end
                
                err(k) = abs(alpha(k)) - abs(TABLE.alpha(i,j,I));
            end
            E(i,j) = sqrt(err'*err)/P  + .01 * (mu - muHat)^2; %minimize RMS estimation error but keep close to mu estimate
            %E(i,j) = err'*err  + .02 * (mu - muHat)^2;
        end
    end
    
    optval = min(min(E));
    minInd = find(E== optval);
    [xInd, yInd] = ind2sub([N,M], minInd(1));
    C = TABLE.C(xInd);
    mu = TABLE.mu(yInd);
    
end