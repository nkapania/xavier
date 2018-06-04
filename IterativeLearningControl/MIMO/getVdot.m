function dv = getVdot(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes)
    deltaFFW = getDeltaFFW(K, v+UxD, veh);
    delta = deltaFFW + deltaL - veh.kLK*(e + veh.xLA*dPsi);
    Fx = fL - veh.Kx*v + veh.m*AxDes;
    FyF = getFyF(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K, AxDes);
    dv = (v+UxD)*beta*r + Fx/veh.m - FyF*delta/veh.m;
end