function [e, dPsi, K, s, distanceToEnd, initStatus, numIters, smallestNorm] = mapMatchEMBED(posE, posN, psi, worldS, worldE, worldN, worldPsi, worldK, openWorld)
   %#codeden
    persistent seed
    
    if isempty(seed)
        seed = 1;
    end
    
    [e, s, K, psiDes, seed, initStatus, numIters, smallestNorm ] = convertToLocalPathEMBED( posE, posN, seed, worldS, worldE, worldN, worldPsi, worldK, openWorld);    
    
    %If map match hasn't converged, set the output to zeros.
    
    if ~initStatus
        e = 0;
        dPsi = 0;
        K = 0;
        s = 0;
        distanceToEnd = -1;
    else
        
        %sanity check - s must be within map boundaries.
        if s < 0
            s = worldS(end) + s; %cycle to end of map
        elseif s > worldS(end)
            s = s - worldS(end); %cycle to beginning of map
        end
        
        
        if openWorld
            distanceToEnd = worldS(end) - s;
        else
            distanceToEnd = -1;
        end   
        
        %%%%Use Steve's interp - note the order of arguments is different
        %%%%than normal interp. Currently kept in here just in case, found
        %%%%better way to do this within convertToLocalPath.
        
        %K = myLinear1DInterpEMBED(s, worldS, worldK);
        %psiDes = myLinear1DInterpEMBED(s, worldS, worldPsi);         
        
    
        %get dPsi
        dPsi = psi - psiDes; 
    
        % Make sure delta Psi is between -pi and pi
        while dPsi > pi
            dPsi = dPsi - 2*pi;
        end
        while dPsi < -pi
            dPsi = dPsi + 2*pi;
        end
        
    end
    
end
      
