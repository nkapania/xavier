function alphaF = getAlphaF(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K)
    deltaFFW = getDeltaFFW(K, v+UxD, veh);
    delta = deltaL - veh.kLK*(e + veh.xLA*dPsi) + deltaFFW;
    alphaF = atan(beta + veh.a*r/(v + UxD)) - delta;
end