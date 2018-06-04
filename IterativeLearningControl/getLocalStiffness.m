function Cbar = getLocalStiffness(alpha, C, muP, muS, Fz)

    del = 1e-4;
    alpha2 = alpha + del;
    alpha1 = alpha - del;

    Fy1 = tireforces(C, muP, muS, alpha1, Fz);
    Fy2 = tireforces(C, muS, muS, alpha2, Fz);
    
    
    Cbar = (Fy2 - Fy1)/(alpha2 - alpha1);
    Cbar = abs(Cbar);
    
end
