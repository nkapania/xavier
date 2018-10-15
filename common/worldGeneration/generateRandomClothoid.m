%Sample clothoid segments to generate a random map

%genRandomMap(numSegments, mu_K, sigma_K, s_mean, sigma_s)

function [s, k] = generateRandomClothoid(ds, kmin, kmax, smin, smax)
    Lstraight = sampleLength(smin, smax);
    Lentry = sampleLength(smin, smax);
    LconstRadius = sampleLength(smin, smax);
    Lexit = sampleLength(smin, smax); 
    
    curvature = sampleCurvature(kmin, kmax);
    
    s1 = 0:ds:Lstraight;
    s2 = (ds:ds:Lentry) + s1(end);
    s3 = (ds:ds:LconstRadius) + s2(end);
    s4 = (ds:ds:Lexit) + s3(end);
    
    k1 = zeros(len(s1), 1);
    k2 = linspace(0, curvature, len(s2))';
    k3 = linspace(curvature, curvature, len(s3))';
    k4 = linspace(curvature, 0, len(s4))';
    
    s = [s1 s2 s3 s4]';
    k = [k1; k2; k3; k4];
    
end

function K = sampleCurvature(kmin, kmax)
    K = kmin + rand()*kmax;
    K = K * sign(randn());
end


function L = sampleLength(Lmin, Lmax)
    L = Lmin + rand()*Lmax;
end
    
    
    
    




