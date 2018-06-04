function muOpt = computeOptimalAction(policy, beliefTuple, pd)
    [~, s , ~] = indexToTuple(beliefTuple(1,1), pd);
    [~, s1, ~] = indexToTuple(beliefTuple(2,1), pd);
    
    if s ~= s1
        error('check this')
    end
    
    maxVal = -Inf;
    optAction = NaN;
    
    N = len(policy);
    %iterate through all alpha vectors. 
    
    for i = 1:N
        alpha = policy{i}.alpha;
        val = alpha(beliefTuple(1,1)+1)*beliefTuple(1,2) + alpha(beliefTuple(2,1) + 1)*beliefTuple(2,2); %sparse dot product of belief state with alpha vector
        if val > maxVal
            optAction = policy{i}.action;
            maxVal = val;
        end
    end
    
    muOpt = pd.actions(optAction + 1);
end
    
    