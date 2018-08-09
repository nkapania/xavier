%Todo: compute a speed profile. The output must be a structure that
%contains three arrays: The distance along path (s), desired velocity at
%every point in space, and desired acceleration at every point in space. 

function prof = generateSpeedTrajectoryOpen(path, veh, maxAccelX, maxAccelY)
%NOTE: maxAccelX and maxAccelY in units of g's to resemble inputting a mu value.
    disp('Generating Speed');
    
    [Ux, Ax] = genSpeedHelper(path.s, path.K, maxAccelX, maxAccelY, 0);
    prof.Ux = Ux; 
    prof.Ax = Ax; 
    prof.s = path.s;
    
end
   