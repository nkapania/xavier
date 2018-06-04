%Since we have a ton of states but only have probability of being in two at any 
%given time, represent "belief tuple" as a 2 x 2 matrix.  

function beliefTuple = getBeliefTuple(s, a, b, pd)
    beliefTuple = zeros(2);
    
    mu = pd.actions(a);
    beliefTuple(1,:) = [tupleToIndex(0, s, mu, pd) b(1)];
    beliefTuple(2,:) = [tupleToIndex(1, s, mu, pd) b(2)];
    
end
    