function [I, numExploredNodes] = astar(P, L, sI, sE, ds)

    numExploredNodes = 0;

    startState = [sI/ds getStartProfile(P)]; %hack - start state corresponds to fastest starting velocity
    closedset = [];
    openset = startState; 
    cameFrom = containers.Map();
    
    n = 1 + (sE - sI)/ds;
    m = len(P);
    
    endState = n; 
    G = Inf*ones(n,m);
    G(startState(1), startState(2)) = 0;
    
    F = Inf*ones(n,m);
    F(startState(1), startState(2)) = G(startState(1), startState(2)) + heuristicCostEstimate(P, L, startState, endState);
    
    while len(openset(:,1)) ~= 0
        [currentState, openset, closedset] = getCurrentState(openset, closedset, F);
        if currentState(1) == n;
            I = reconstructPath(cameFrom, currentState);
            return
            
        else
            numExploredNodes = numExploredNodes + 1;
            for i = 1:m
                neighborState = [currentState(1)+1 i];
                if contained(closedset, neighborState)
                    continue
                end
                
                tentativeGscore = G(currentState(1), currentState(2)) + getCost(P, currentState, neighborState);
                
                if ~contained(openset, neighborState) || tentativeGscore < G(neighborState(1), neighborState(2))
                    key = num2str(neighborState); 
                    cameFrom(key) = currentState;
                    G(neighborState(1), neighborState(2)) = tentativeGscore;
                    F(neighborState(1), neighborState(2)) = G(neighborState(1), neighborState(2)) + heuristicCostEstimate(P, L, neighborState, endState);
                    
                    if ~contained(openset, neighborState) && tentativeGscore < Inf
                        openset = [openset; neighborState]; 
                    end
                    
                end
                
            end
            
        end
        
    end
    
    error('No Path Found')

end
                
                
                    
                
            
            
    
   
    
    
    