function ind = binObservation(alpha, observations)
    N = len(observations)+1;
    if alpha < observations(1)
        ind = 1;
        return;
    elseif alpha > observations(end)
        ind = N;     
        return
    end
    
    for i = 1:N-2
        if alpha > observations(i) && alpha < observations(i+1)
            ind = i+1;
            return
        end
    end
    
end