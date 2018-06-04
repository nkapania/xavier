function UxTable = computeUxTable(P, actions, s)
    
    N = len(s); M = len(actions);
    UxTable = zeros(N, M);
    
    load THraceUxTable
    
    for i = 1:M
        mu = actions(i);
        scaleFactor = sqrt(mu/.97); %HACK - this is what the base profile was generated at.
        Ux = scaleFactor*(interp1(posDesired', UxDesired', s, 'linear','extrap'));
        UxTable(:,i) = Ux;
    end
end
        
    
            
    