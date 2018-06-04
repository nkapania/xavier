function [FxFFW, FxDrag, FxST,UxDesired,AxDesired, brakeMode] =  getFxFFW(s, vxCG, yawRate, grade, delta, FBforce, vp, Kx, muCommand, maxMu, veh, mapType)
%#codegen
    
    sDesired = vp.s; 
    AxDesiredFull = vp.Ax;
    UxDesiredFull = vp.Ux;
    a = veh.a; b = veh.b; m = veh.m;
    fdrag = veh.D; g = veh.g;
    rollResistance = veh.rollResistance;
    brakeTimeDelay = veh.brakeTimeDelay;
    
    %state machine states
    BRAKE_MODE = 1;
    ACCEL_MODE = 0;
    
    persistent state
    if isempty(state)
        state = ACCEL_MODE;
    end
    
    %%%%%%%%%%%% COMMON TO BOTH STATES %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %don't do speed tracking if we are doing slip circle feedback
    if (FBforce == 0);
        enableSpeedFeedback=1;
    else
        enableSpeedFeedback = 0;
    end
    
    %get AxDesired and UxDesired
    scaleFactor = min( 1  , abs(muCommand/maxMu) ); %Can't set new mu higher than that in map
    AxDesired = scaleFactor * interp1(sDesired,AxDesiredFull,s,'linear',0);
    UxDesired = sqrt(scaleFactor) * interp1(sDesired,UxDesiredFull,s,'linear',0);
    
    %Basic Proportional feedback with feedforward and drag compensation
    turningDrag   = m*b/(a+b)*abs(yawRate*vxCG)*abs(tan(delta));
    aeroDrag      = fdrag*vxCG*vxCG;
    inclinedDrag  = -m*g*sin(grade);  %negative sign due to GPS convention for grade
    FxDrag = turningDrag+rollResistance+aeroDrag+inclinedDrag;  

    
    %%%%%%%%%%%%%%%%%%%%%% STATE MACHINE LOGIC %%%%%%%%%%%%%%%%%%%%
    
    if state == ACCEL_MODE
        lookAheadDist = brakeTimeDelay*(vxCG+abs(AxDesired)*brakeTimeDelay/2);
        
        if mapType == 0
            maxUx = interp1(sDesired,UxDesiredFull,mod(s + lookAheadDist, sDesired(end)),'linear',0);    
        else
            maxUx = interp1(sDesired,UxDesiredFull,s + lookAheadDist,'linear',0);
        end
        
        if vxCG + abs(AxDesired)*brakeTimeDelay >= maxUx
                state = BRAKE_MODE;
        end
        
        %don't brake 
        FxFFW = m*abs(AxDesired); 
        FxST   = enableSpeedFeedback*Kx*(UxDesired-vxCG);
    elseif state == BRAKE_MODE
        if ( (UxDesired-vxCG) > 3 )
              state = ACCEL_MODE;
        end
          
        FxFFW  = m*AxDesired;
        FxST   = enableSpeedFeedback*Kx*(UxDesired-vxCG);
    end          

    brakeMode = state;
    
end