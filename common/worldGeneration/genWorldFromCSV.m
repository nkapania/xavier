function world = genWorldFromCSV(file)
    disp('Generating World From CSV ....')
    map = loadMapData(file);
    
    if map.cumLength(1) == 0
        primitive_s = [map.cumLength; map.totalLength];
    else
        primitive_s = [0; map.cumLength];
    end
    
    primitive_k = [map.kStart; map.kEnd(end)];
    primitive_E = [map.EInit; map.EInit(1)];
    primitive_N = [map.NInit; map.NInit(1)];
    primitive_psi = [map.psiInit; map.psiInit(1)];
    
    %build up road structure
    world.road_IC = [primitive_psi(1)-pi/2; primitive_E(1); primitive_N(1)]; %csv's have 0 degrees defined due east due to GPS convention
    
    world.roadE = [];
    world.roadN = [];
    world.roadPsi = [];
    world.K       = [];
    world.s       = [];
    world.isOpen = map.type;
    
    N = len(primitive_k);
        
    for i = 2:N
        IC = [primitive_psi(i-1)-pi/2; primitive_E(i-1); primitive_N(i-1)];
        
        %this edge logic connects the beginning to end of map.
        if i ==N
            [posE, posN, psi, K, s] = integrateClothoid(IC, primitive_k(i-1:i), primitive_s(i-1:i), 1);
        else
            [posE, posN, psi, K, s] = integrateClothoid(IC, primitive_k(i-1:i), primitive_s(i-1:i), 0);
        end
        
        world.roadE = [world.roadE; posE];
        world.roadN = [world.roadN; posN];
        world.roadPsi = [world.roadPsi; psi];
        world.K       = [world.K;   K];
        world.s       = [world.s;   s];
    end
        


end