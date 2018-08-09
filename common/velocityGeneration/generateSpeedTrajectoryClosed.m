%Todo: compute a speed profile. The output must be a structure that
%contains three arrays: The distance along path (s), desired velocity at
%every point in space, and desired acceleration at every point in space. 

function prof = generateSpeedTrajectoryClosed(path, veh, maxAccelX, maxAccelY)
%NOTE: maxAccelX and maxAccelY in units of g's to resemble inputting a mu value.
%assumes equally spaced worlds.

    disp('Generating Speed');
    
    K = path.K;
    s = path.s;
    
    
    %calculate lowest velocity point
    g = 9.81;
       
    for i=1:len(s)
        UxSS(i) = sqrt(maxAccelY*g/(abs(K(i))+1e-8));
    end
    
    
    [minUx,idx] = min(UxSS);

    
    %shift so we generate starting at the lowest velocity point
    inds = 1:len(s); shiftedInds = circshift(inds, -idx);
    kShifted = K(shiftedInds);
    
    [UxShift, AxShift] = genSpeedHelper(s, kShifted, maxAccelX, maxAccelY, minUx);
    
    %unshift back to original
    Ux = circshift(UxShift, idx );
    Ax = circshift(AxShift, idx );
    
    prof.Ux = Ux; 
    prof.Ax = Ax; 
    prof.s = path.s;
    
end
   