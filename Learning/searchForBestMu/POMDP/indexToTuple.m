function [u, s, m] = indexToTuple(state, pd)

    if state < 0 || state >= pd.NUM_STATES
        error('invalid state')
    end

    u = floor(state/(pd.S*pd.NUM_ACTIONS));
    
    left = mod(state, pd.S*pd.NUM_ACTIONS);
    s = pd.ds*floor(left/pd.NUM_ACTIONS)+pd.s(1);
    
    m = pd.actions(mod(left, pd.NUM_ACTIONS)+1);
end
    