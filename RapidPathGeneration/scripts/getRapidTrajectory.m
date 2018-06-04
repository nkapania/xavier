function optResult = getRapidTrajectory(refWorld, vpRef, veh)
    
    %downsample world and velocity profile objects for optimization   
    world = downsampleWorld(refWorld,10);
    velocityProfile.s = world.s;
    velocityProfile.Ux = interp1(vpRef.s, vpRef.Ux, velocityProfile.s);
    velocityProfile.Ax = interp1(vpRef.s, vpRef.Ax, velocityProfile.s);
    
    optResult = getCurvatureProfile(world, velocityProfile, veh);
    

end