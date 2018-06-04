function [A B D aF aR deltaFFW betaFFW] = getAllSys(veh, Ux, K, ts)

    A = {};
    B = {};
    N = numel(Ux);
    deltaFFW = zeros(N,1); betaFFW = zeros(N,1); 
    
    for i = 1:N
        
        aF(i) = force2alpha(veh.FyFtable, veh.alphaFrontTable, veh.b/veh.L*veh.m*Ux(i)^2*K(i)); % <- F desired
        aR(i) = force2alpha(veh.FyRtable, veh.alphaRearTable, veh.a/veh.L*veh.m*Ux(i)^2*K(i));
        
        betaFFW(i)  = aR(i) + veh.b*K(i);
        deltaFFW(i) = K(i)*veh.L + aR(i) - aF(i) - veh.kLK*veh.xLA*betaFFW(i);
        
        [a b d] = getAffineModel(Ux(i), K(i), ts(i), veh, aF(i), aR(i));
        A(i) = {a};
        B(i) = {b};
        D(i) = {d};
    end
end