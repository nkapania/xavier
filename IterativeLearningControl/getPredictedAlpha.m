%#codegen

function [alphaDes, C, mu, alphaTable, FyTable] = getPredictedAlpha(s, FyDes, muTable, Ctable, sTable, Fz, lim)
        ind = stairLookup(s, sTable);
        mu = muTable(ind); C = Ctable(ind);    
        slide = abs( atan(3*mu*Fz/C) );
        slide = min(slide, abs(lim)); %abs for safety
        
        alphaTable = linspace(-slide, slide, 50);
        FyTable = tireforces(C,mu,mu,alphaTable,Fz);
        alphaDes = force2alpha(FyTable, alphaTable, FyDes);
end
