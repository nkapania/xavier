function FyF = getFyF(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes)
    alphaF = getAlphaF(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K);
    FxF =  veh.b/veh.L*min(fL - veh.Kx*v + veh.m*AxDes , veh.powerLimit/(UxD+v)); %power limit
    FyF = coupledTireForces(alphaF, FxF, veh, 'front');
end