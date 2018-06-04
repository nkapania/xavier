function [deltaILC, FxILC] = PD_ILC(e, v, dIn, fIn, ts)
        kPD = .05;  kDD = 0.05; %K and P gains    
        kPF = 2000; kDF = 200; 
        
        e1 = circshift(e,-1); e(end) = e(end-1);
        v1 = circshift(v,-1); v(end) = v(end-1); 
    
        dOut = dIn -kPD*e1 - kDD*(e1 - e)/ts;
        fOut = fIn -kPF*v1 - kDF*(v1 - v)/ts;
    
        omega_corner = .05;
        [num, den] = butter(3, omega_corner);
        deltaILC = filtfilt(num, den, dOut);
        FxILC    = filtfilt(num, den, fOut);
end

