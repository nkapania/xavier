function switchPoints = findSwitchPoints(p1, p2, kTol, headingTol)
    switchPoints = []; 
    
    for i = 1:len(p1.roadE)
        N = p1.roadN(i); 
        E = p1.roadE(i);
        
        %taking atan(tan)) of psi normalizes them to -pi/2 to pi/2
        P = atan(tan(p1.roadPsi(i)));
        
        [~, idx] = min(sqrt( (p2.roadN - N).^2 + (p2.roadE - E).^2)); 
        kDiff = abs(p1.K(i) - p2.K(idx));
        angleDeviation = abs(P -atan(tan(p2.roadPsi(idx))));     
        
        %check if point is within required tolerances
        if kDiff < kTol && angleDeviation < headingTol 
            
            
            %only add a switch point if it is sufficiently far from last
            %one. This solves the problem of many switch points added close
            %to one another
            
            if isempty(switchPoints)
                distFromLastSwitchPoint = Inf;
            elseif p2.s(idx) < p2.s(switchPoints(end))
                distFromLastSwitchPoint = p2.s(idx) + (p2.s(end) - p2.s(switchPoints(end)));
            else
                distFromLastSwitchPoint = p2.s(idx) - p2.s(switchPoints(end));
            end
            
            if distFromLastSwitchPoint > 100
                switchPoints = [switchPoints; idx];
            end
        end
    end
end
 
   
        
        
        
         