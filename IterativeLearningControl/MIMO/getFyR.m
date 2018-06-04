function FyR = getFyR(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes)
    alphaR = getAlphaR(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K);
    FxR = veh.a/veh.L*min(fL - veh.Kx*v + veh.m*AxDes, veh.powerLimit/(UxD+v));
    FyR = coupledTireForces(alphaR, FxR, veh, 'rear');
end