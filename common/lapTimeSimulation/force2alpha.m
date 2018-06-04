%Nitin Kapania, 11/2/2013

function alpha = force2alpha(forceTable, alphaTable, Fdes) 

%#codegen
if Fdes > max(forceTable)
    Fdes = max(forceTable) - 1;
elseif Fdes < min(forceTable)
    Fdes = min(forceTable) + 1;
end

alpha = interp1(forceTable, alphaTable, Fdes,'linear');

end