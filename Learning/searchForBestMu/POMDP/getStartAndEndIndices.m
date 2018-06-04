function [lowInd, highInd] = getStartAndEndIndices(s)
    N = len(s);
    lowInd = [];
    highInd = [];
    for i = 2:N
        if s(i) + 100 < s(i-1) %hack
            lowInd = [lowInd; i];
            highInd = [highInd; i-1];
        end
    end
end