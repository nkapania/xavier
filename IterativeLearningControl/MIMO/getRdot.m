function dr = getRdot(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes)
    FyF = getFyF(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes);
    FyR = getFyR(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes);
    dr = (veh.a*FyF - veh.b*FyR)/veh.Iz;
end