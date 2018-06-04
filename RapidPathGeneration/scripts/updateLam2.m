function l2New = updateLam2(world, refWorld)
    disp('Updating Lambda Weights')
    
    l2Old = refWorld.lam2;

    N = len(l2Old.s);
    l2New.s = zeros(N,1);
    l2New.weights = l2Old.weights; %keep the same weight values, just update the s values based on changes to map length.
    
    posE = interp1(refWorld.s, refWorld.roadE, l2Old.s);
    posN = interp1(refWorld.s, refWorld.roadN, l2Old.s);

    clear mapMatch
    for i = 2:N-1     
        [~, ~, ~, l2New.s(i)] = mapMatch(posE(i), posN(i), 0, world);
    end
        
    l2New.s(end) = l2New.s(end-1) + 1; %HACK
end