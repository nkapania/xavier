function [FxF, FxR] = getFx(FxDes, Ux, veh)

    %implement engine and brake limits
    if FxDes > 0  %could be power limited/limited by roll resistance/drag 
        Fx = min(veh.powerLimit/Ux - 0.7*Ux^2 - 300, FxDes); 
    else
        Fx = FxDes; %no brake limit currently
    end
    
    FxF = Fx*veh.b/veh.L;
    FxR = Fx*veh.a/veh.L;
    
    
end