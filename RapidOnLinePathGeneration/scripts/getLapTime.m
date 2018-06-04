function [lapTime, ts] = getLapTime(s, Ux)
    ds = diff(s);    
    ts = [ds(1); ds]./Ux; % add the first step twice
    lapTime = sum(ts);
end