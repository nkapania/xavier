function [e, dPsi, K, s] = mapMatch(posE, posN, psi, world)
    persistent seed
    
    if isempty(seed)
        seed = 0;
        flag = 1;
    else
        flag = 0;
    end
    
    p_EN = [posE; posN];
    p_path = convertToLocalPath(p_EN, seed, flag, world);
    
    seed = p_path;
    
    %avoids small bug where we sometimes go to negative s values
    %at start of map.
    if p_path(1) < 0
        s = 0;
    else
        s = p_path(1);
    end
    e = p_path(2);
    K = interp1(world.s, world.K, s);
    psiDes = interp1(world.s, world.roadPsi, s);
    dPsi = psi - psiDes;
    
end
      
