function alphaR = getAlphaR(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, K)
    alphaR = atan(beta - veh.b*r/(v + UxD));
end