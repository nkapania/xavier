%This code implements the feedforward steering based on center of
%percussion.

%Nitin Kapania, based on code from Mick, June 7, 2013.

function [deltaFFW alphaDesired UySimOut rSimOut] = getDeltaFFW(Ux, axDesired, Uy, r, K, slope, Ts, muFFW)  
%#codegen
    
    Cf = 160000; 
    Cr = 180000;
    m = 1.5124e+003;
    a = 1.0441;
    b = 1.4248;
    L = 2.4689;
    Iz = 2.2499e+003;
    muP = muFFW;
    muS = muFFW;
    lam1 = 2;
    lam2 = 0;
    lam3 = 0;
    lam4 = 2;    

    persistent UyEst;    %estimated values of Uy and r are saved from iteration to iteration
    persistent rEst;
    persistent UySim;
    persistent rSim;
    
    if isempty(UyEst)    %initialize to 0 on first iteration
        UyEst = 0;
        rEst = 0;
        UySim = 0;
        rSim  = 0;
    end

    %compute some variables
    ds=Ux;
    FzR = m*a*9.81/L;
    
    UyError = Uy - UyEst;
    rError = r - rEst;
    
    
    if (Ux > 1)                             %compute rear slip if velocity is high enough
        alphaRest=atan(UyEst/Ux-b*rEst/Ux);
        alphaRsim=atan(UySim/Ux-b*rSim/Ux);
        
        ddsEst = axDesired + UyEst*rEst;
        ddsSim = axDesired + UySim*rSim;
    else
        alphaRest=0;
        alphaRsim=0;
        
        ddsEst = 0;
        ddsSim = 0;
    end
    
    
    dK = ds*slope;          %rate of change of slope
    
    FyFFWest=m*b/L*K*ds^2+Iz/L*(K*ddsEst+dK*ds);   %this is the FFW control law.
    FyFFWsim=m*b/L*K*ds^2+Iz/L*(K*ddsSim+dK*ds);
    
    
    %Output state estimates; 
    UyEstOut = UyEst;
    rEstOut  = rEst;
    UySimOut = UySim;
    rSimOut  = rSim;
    

    %now simulate rear tire force and use a bike model to predict new
    %estimates of Uy and r.
        
    %It turns out we have always been using a linear tire model in our code
    %- need to discuss this with Chris. 
    %FyRest = -Cr*tan(alphaRest);
    %FyRsim = -Cr*tan(alphaRsim);
    
    FyRest = tireforces(Cr, muP, muS, alphaRest,FzR);
    FyRsim = tireforces(Cr, muP+.05, muS+.05, alphaRsim,FzR);
    
    dUySim = (FyFFWsim + FyRsim)/m - rSim*Ux;
    drSim  = (a*FyFFWsim - b*FyRsim)/Iz;  
    dUyEst = (FyFFWest+FyRest)/m-rEst*Ux + lam3*rError + lam4*UyError;  %bike model equations with observer feedback gains
    drEst = (a*FyFFWest-b*FyRest)/Iz + lam1*rError + lam2*UyError;     
            
    %update estimated states
    
    if (lam1 < 500)
        UyEst=UyEst+Ts*dUyEst;
        rEst=rEst+Ts*drEst;
    else
        UyEst = Uy;
        rEst = r;
    end
    
    UySim = UySim + Ts*dUySim;
    rSim  = rSim  + Ts*drSim;
    
    muPeakTable=muP;
    muSlideTable=muS;
    alphaSlideF = abs( atan(3*muPeakTable*m*b/L*9.81/Cf) );
    alphaFrontTable=[-alphaSlideF:.01:alphaSlideF];   % vector of front alpha (rad)
    FyFtable = tireforces(Cf,muPeakTable,muSlideTable,alphaFrontTable,m*b/L*9.81);
    
    [val, maxInd] = max(FyFtable);
    [val, minInd] = min(FyFtable);
    
    alphaDesired = interp1(FyFtable(maxInd:minInd), alphaFrontTable(maxInd:minInd), FyFFWest,'linear',-6*pi/180*sign(FyFFWest));
    
    deltaFFW = atan((UyEst+a*rEst)/Ux)  - alphaDesired;
    
    UySimOut = UySim;
    rSimOut = rSim;
    



