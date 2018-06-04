function ALPHA = createLookupTable(C, mu, FyD, Fz)

    N = len(C);
    M = len(mu);
    P = len(FyD);
    
    ALPHA = zeros(N, M, P);

    for k = 1:P
        disp(['Generating Lookup Table: '  num2str(round(k/P*100)) ' Percent complete']);
        for i = 1:N
            for j = 1:M    
                try
                    alphaSlide = abs( atan(3*mu(j)*Fz/C(i)) );
                    ALPHA(i,j,k) = fzero(@(alpha)tireforcesAnon(alpha, C(i), mu(j), Fz, FyD(k)), [0 -alphaSlide*sign(FyD(k))]);
                catch
                    ALPHA(i,j, k) = NaN;
                end
            end
        end
    end
    
end

