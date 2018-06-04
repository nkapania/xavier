function out = makeMonotonic(in)
    sT = in.sTrue;
    ind = find(diff(sT) < 0);
    if len(ind) > 1
        error('Not Monotonic with Respect to s')
    end
    
    out = shiftFields(in, -ind);
end
    
    
    