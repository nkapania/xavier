function buffNew = updateBuffer(world, refWorld)
    
    buffOld = refWorld.buff;

    N = len(buffOld.s);
    buffNew.s = zeros(N,1);
    buffNew.b = buffOld.b; %keep the same buffer values, just update the s values based on changes to map length.
    
    for i = 2:N-1
        posE = interp1(refWorld.s, refWorld.roadE, buffOld.s(i));
        posN = interp1(refWorld.s, refWorld.roadN, buffOld.s(i));
        
        clear mapMatch
        [~, ~, ~, buffNew.s(i)] = mapMatch(posE, posN, 0, world);
    end
    
    buffNew.s(N) = world.s(end);
    
end