function p = getTransitionProbability(endState, action, startState, pd)
    
    %just simple probability distribution for now
    [u0, s0, m0] = indexToTuple(startState, pd);
    [u1, s1, m1] = indexToTuple(endState, pd);

    ind = find(pd.actions == m0);
    
    if m1 >= m0 %going up
       p = pd.T{ind,1}(u0+1, u1+1);
    else %going down
       p = pd.T{ind,2}(u0+1, u1+1);
    end
    
end
    