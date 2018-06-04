function [s, mu, Ux, UxDes] = unpackOptResults(P, I)
    N = len(I(:,1));
    s = zeros(N, 1); mu = zeros(N, 1); 
    UxDes = zeros(N,1); Ux = zeros(N, 1);
    for i = 1:N
        prof = I(i, 2);
        s(i) = P{prof}.s(i);
        mu(i) = P{prof}.currMu(i);
        UxDes(i) = P{prof}.UxDesired(i);
        Ux(i)    = P{prof}.Ux(i);
    end
    
    disp(['A* Lap Time Equals: ' num2str(trapz(s, 1./Ux)) ])
    
end
        