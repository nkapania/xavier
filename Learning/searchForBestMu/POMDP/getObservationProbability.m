function p = getObservationProbability(state, pd)
    p = zeros(pd.NUM_OBSERVATIONS);
    [u, s, m] = indexToTuple(state, pd);
    p = pd.O(u+1,:);
    
    if sum(p) ~= 1
        error('check this')
    end 

end