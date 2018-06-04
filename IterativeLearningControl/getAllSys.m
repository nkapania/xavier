function [A, B, C] = getAllSys(veh, Ux, K, s, ts)

    A = {};
    B = {};
    N = numel(Ux);
    
    FyFdes = veh.b/veh.L*veh.m*Ux.^2.*K;
    FyRdes = veh.a/veh.L*veh.m*Ux.^2.*K;
    
    for i = 1:N
        
        [aF, Cf, muF] = getPredictedAlpha(s(i), FyFdes(i), [veh.muF veh.muF], [veh.Cf veh.Cf], [s(1) s(end)], veh.FzF, veh.alphaFlim);
        [aR, Cr, muR] = getPredictedAlpha(s(i), FyRdes(i), [veh.muR veh.muR], [veh.Cr veh.Cr], [s(1) s(end)], veh.FzR, veh.alphaRlim);
        
        [a, b] = getAffineModel(Ux(i), ts, veh, aF, aR, Cf, Cr, muF, muR);
        A(i) = {a};
        B(i) = {b};
    end
    
    C = [1 0 0 0];
    
end