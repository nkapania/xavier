%Implements the slip circle controller.
%Nitin Kapania, 6/6/2013

function [FxST, FxFB]  = slipCircleController(aF, aR, FxIn)
   %#codegen
    %normalize slips
    limAF = 8*pi/180; limAR = 6*pi/180;
    aF =aF/limAF; aR= aR/limAR; K = 3000;
    
    frontSliding = abs(aF) > 1; %check if front is sliding
    rearSliding =  abs(aR) > 1; %check if rear is sliding
    
    if frontSliding && rearSliding    %if both are sliding, use which one is greater
        if abs(aF) > abs(aR)
            FxFB = -K*(abs(aF) - 1);     %add extra gain if alpha slip norm is greater than 1
        else
            FxFB = -K*(abs(aR) - 1);
        end
        
    elseif frontSliding      %if both are sliding, use front slip values       
            FxFB = -K*(abs(aF) - 1); 
    elseif rearSliding       %if rear is sliding, use rear slip values
            FxFB = -K*(abs(aR) - 1);
    else                     %if nothing is sliding, don't add any longitudinal force
        FxFB = 0;
    end
    
    if FxFB == 0
        FxST = FxIn;
    else
        FxST = 0;
    end
    
    
end
        
        
    