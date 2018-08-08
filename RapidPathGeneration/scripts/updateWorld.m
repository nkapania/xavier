function [world] = updateWorld(refWorld, opt, bounds)

    %get new EN coordinates
    e = interp1(opt.s, opt.e, refWorld.s,'cubic');
    [posE, posN] = convertPathToGlobal(refWorld, refWorld.s, e); 
    
    %generate a new world object from the EN point cloud
    world = genWorldFromEN(posE, posN);
    
    
    %update buffer and lam2
    world.buff = updateBuffer(world, refWorld);
%    world.lam2 = updateLam2( world, refWorld); 

    %recompute lane width
    world = getLaneWidth( world, bounds);
    world.isOpen = refWorld.isOpen;
    
end