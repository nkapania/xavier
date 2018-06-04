%Assumes thunderhill west and hard coded mu and s discretization;

function idx = tupleToIndex(u, s, m, pd)
    
    uIDX = u;
    if (u ~= 0 && u ~= 1)
        error('Check This')
    end
    
    sIDX = find(pd.s == s) - 1;
    mIDX = find(pd.actions == m) - 1;
    
    if len(sIDX) ~= 1
        error('check this')
    elseif len(mIDX) ~= 1
        error('check this')
    end
    
    idx = pd.S*pd.NUM_ACTIONS*uIDX + pd.NUM_ACTIONS*sIDX + mIDX;
    
end

    
        