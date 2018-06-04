%#codegen

function ind = stairLookup(s, table)
    N = len(table);
    for i = 1:N-1
        if s > table(i) && s < table(i+1)
            ind = i;
            return
        end
    end
    ind = 1; %shouldn't ever get here.
end