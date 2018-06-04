function alphaDes = getPredictedAlpha(s, FyDes, muTable, Ctable, sTable, Fz)
    N = len(s); alphaDes = zeros(N,1);
    for i = 1:N
        ind = stairLookup(s(i), sTable);
        mu = muTable(ind); C = Ctable(ind);    
        slide = abs( atan(3*mu*Fz/C) );
        alphaTable = -slide:.01:slide;
        FyTable = tireforces(C,mu,mu,alphaTable,Fz);
        alphaDes(i) = force2alpha(FyTable, alphaTable, FyDes(i));
    end
end


function ind = stairLookup(s, table)
    N = len(table);
    for i = 1:N-1
        if s > table(i) && s < table(i+1)
            ind = i;
            return
        end
    end
    error('Lookup not found');
end