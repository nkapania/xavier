function dBeta = getBetaDot(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes)
    FyF = getFyF(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes);
    FyR = getFyR(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes);
    dBeta = (FyF + FyR)/(veh.m*(v + UxD)) - r;
end