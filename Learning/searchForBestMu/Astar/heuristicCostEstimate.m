function cost = heuristicCostEstimate(P, L, startState, endState)
    ind = startState(1); profile = startState(2);

    sI = P{profile}.s(ind);
    Ux = P{profile}.Ux(ind);
    sE = P{profile}.s(endState);
    
    ax = 2.5; %estimate of max acceleration
    
    %simple A* heuristic - assume max accel until the end
    %cost =  log(ax*(sE - sI) +  Ux)/ax - log(Ux)/ax;
    
    %no A* heuristic
    %cost = 0;
    
    %more restrictive A* heuristic - assume greedy cost computed earlier
    cost = L(end) - L(ind); %assumes costs have already been computed          
    
end