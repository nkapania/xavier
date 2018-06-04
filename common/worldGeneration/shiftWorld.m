function shiftedWorld = shiftWorld(world, shiftDistance)
    
    if abs(shiftDistance) > world.s(end)
        error('Shift Magnitude Must be Between 0 and Length of Map')
    end
    
    idx = 1;
    if shiftDistance < 0
        shiftDistance = world.s(end) + shiftDistance;
    end
    
    while world.s(idx) < shiftDistance
        idx = idx+1;
    end
    
    shiftedWorld = world;
    shiftedWorld.K = circshift(world.K, -idx);
    shiftedWorld.roadPsi = circshift(world.roadPsi, -idx);
    shiftedWorld.roadE = circshift(world.roadE, -idx);
    shiftedWorld.roadN = circshift(world.roadN, -idx);
    %shiftedWorld.widthLeft = circshift(world.widthLeft, -idx);
    %shiftedWorld.widthRight = circshift(world.widthRight, -idx);
    shiftedWorld.road_IC = [shiftedWorld.roadPsi(1); shiftedWorld.roadE(1);...
        shiftedWorld.roadN(1)];
    
    
end
    
    