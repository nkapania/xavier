function [current, opensetOut, closedsetOut] = getCurrentState(openset, closedset, F)
    n = len(openset(:,1));
    cost = zeros(n,1);
    for i = 1:n
        cost(i) = F(openset(i,1), openset(i, 2) );
    end
    
    [minVal, I] = min(cost);
    
    current = openset(I(1), :); %arbitrary tiebreaker
    opensetOut = openset;
    opensetOut(I(1), :) = [];
    closedsetOut = [closedset; current];
    
end