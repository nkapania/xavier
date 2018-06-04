function world = genWorldFromSK(prim_s, prim_k)

    N = len(prim_k);

    prim_E = zeros(N,1);
    prim_N = zeros(N,1);
    prim_psi = zeros(N,1);
    
    world.road_IC = [prim_psi(1); prim_E(1); prim_N(1)];
    
    world.roadE = [];
    world.roadN = [];
    world.roadPsi = [];
    world.K       = [];
    world.s       = [];
    world.isOpen = 1; %maps from SK must be open
    
    for i = 2:N
        IC = [prim_psi(i-1); prim_E(i-1); prim_N(i-1)];
        
        %this edge logic prevents double counting points between the beginning and end of segments
        if i ==N
            [posE, posN, psi, K, s, endPoint] = integrateClothoid(IC, prim_k(i-1:i), prim_s(i-1:i), 1);
        else
            [posE, posN, psi, K, s, endPoint] = integrateClothoid(IC, prim_k(i-1:i), prim_s(i-1:i), 0);
        end
        
        %since there's no CSV, just start next iteration from where you
        %left off.
        prim_psi(i) = endPoint(1); prim_E(i) = endPoint(2); prim_N(i) = endPoint(3);
        
        world.roadE = [world.roadE; posE];
        world.roadN = [world.roadN; posN];
        world.roadPsi = [world.roadPsi; psi];
        world.K       = [world.K;   K];
        world.s       = [world.s;   s];
    end
    
    


end