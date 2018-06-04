function lapTime = getLapTime(start, idx, s, t)
    N = len(s);
    for i = (idx + 1) : N
        try
           flag =  (s(i-1) < start) &&  (s(i+1) > start) ;
        catch
            flag = 0;
        end
        
        if flag
            lapTime = t(i) - t(idx);
            return
        end
        
    end
    
    lapTime = NaN;
end
    
    