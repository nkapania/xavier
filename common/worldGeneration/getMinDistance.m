%get minimum distance between a point and a point cloud representing a road
%boundary, racing line, etc. Can make this more sophisticated for a
%speedup.

function shortest = getMinDistance(point, line)

    persistent lastInd
    if isempty(lastInd)
        lastInd = -1;
    end
    
    n = numel(line(:,1));
    
    N_UP = 15;
    N_DOWN = 15;
    
    
    shortest = Inf;
    %search the whole map
    if lastInd == -1
        for i = 1:n
            dist = norm(point - line(i,:));
            if dist < shortest
                shortest = dist;
                lastInd = i;
            end
        end
    %search around the map    
    else
        idx = lastInd;
        i = 0;
        
        while i < N_UP
            dist = norm(point - line(idx,:));
            if dist < shortest
                shortest= dist;
                lastInd = idx;
            end
                
            if idx == n
                idx = 1;
            else
                idx = idx + 1;
            end
            i = i+1;
            
        end
        
        i = 0;
        idx = lastInd;
        
        while i < N_DOWN
            dist = norm(point - line(idx,:));
            if dist < shortest
                shortest = dist;
                lastInd = idx;
            end
            
            if idx == 1
                idx = n;
            else
                idx = idx - 1;
            end
            i = i+1;
        end
        
    end
        
        
end