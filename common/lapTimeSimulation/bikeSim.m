%main workhorse of racing simulator - this is the main loop that simulates
%a bike model with Fiala tires. Longitudinal/Lateral tire force coupling is
%modeled using tire derating method from Rami Hindiyeh.
function [simout, lapTime] = bikeSim(world, veh, ts, velocityProfile, ilc)
    
    %get start state - note that this assumes we start on the straight!!!
    Ux = velocityProfile.Ux(1); Uy = 0; r = 0; 
    psi  = world.roadPsi(2);
    posE = world.roadE(2);
    posN = world.roadN(2);
    
    if strcmp(veh.mapMatch, 'euler')
        e = 0; s = 0; dPsi = 0;
    end
    
    i = 1; t = 0;
    
    %clear mapMatch functions to avoid mapMatching to previous iterations
    clear mapMatch; clear mapMatchEMBED;
    
    while true

        %perform map matching 
        if strcmp(veh.mapMatch, 'closest')
            [e, dPsi, K, s] = mapMatch(posE, posN, psi, world); initStatus = 1;
        elseif strcmp(veh.mapMatch, 'euler')
            K = interp1(world.s, world.K, s); initStatus = 1;
        elseif strcmp(veh.mapMatch, 'embed')
            [e, dPsi, K, s, dst2end, initStatus] = mapMatchEMBED(posE, posN, psi, world.s, world.roadE, world.roadN, world.roadPsi, world.K, world.isOpen);
        else 
            error('Invalid Map Match Type')
        end

        %check to see if we are at the end of the map.
        if s > world.s(end) - .55; break; end
%         if i == 100
%             break
%         end
        
        %check to see if we have gone off the track
         if abs(e) > 5
             disp('Car has gone off the track')
             break;
         elseif isnan(s)
             disp('NaN Values Encountered ... terminating')
             break;
         end
            

        %calculate steering inputs
        [deltaFFW,alphaFdes,alphaRdes,betaFFW] =  getDeltaFFW(K, Ux, veh);    
        deltaFB = -veh.kLK*(e + veh.xLA*sin(dPsi+betaFFW));
        
        %turn off FFW steering if we are simulating ILC and interp ILC commands.
        if nargin == 4
            deltaILC = 0;
        else
            deltaILC = interp1(ilc.s, ilc.d, s, 'linear', 0);
            deltaFFW = 0; 
        end
        
        delta = deltaFB + deltaFFW + deltaILC;

        %calculate tire slips
        if Ux < 2
            alphaF = 0;
            alphaR = 0;
        else
            alphaF = atan((Uy + veh.a*r)/Ux) - delta;
            alphaR = atan((Uy - veh.b*r)/Ux);
        end
        
        if initStatus
            [FxFFW, FxDrag, FxST, UxDesired, AxDesired, brakeMode] =  getFxFFW(s, Ux, r, 0, delta, 0 ,velocityProfile, veh.Kx, 1, 1, veh, world.isOpen);
            %[FxST, FxFB] = slipCircleController(alphaF, alphaR, FxST);
            FxFB = 0;
        else
            FxFFW = 0; FxDrag =0; FxST = 0; UxDesired = 0; AxDesired = 0; FxFB = 0;
        end
        
        %turn off FFW FX if we are simulating ILC and interp ILC commands.
        if nargin == 4
            FxILC = 0;
        else
            FxILC    = interp1(ilc.s, ilc.f, s, 'linear', 0);
            FxFFW = 0;
        end
        
        FxDes = FxFFW + FxST + FxILC + FxFB; 
        [FxF, FxR] = getFx(FxDes, Ux,  veh);
        FyF = coupledTireForces(alphaF, FxF, veh, 'front');
        FyR = coupledTireForces(alphaR, FxR, veh, 'rear' );  
        
        %update states
        dUy = (FyF + FyR)/veh.m - r*Ux;
        dr = (veh.a*FyF - veh.b*FyR)/veh.Iz;
        dUx = Uy*r + (FxF + FxR - FyF*delta)/veh.m;
        if strcmp(veh.mapMatch, 'euler')
            de = Uy*cos(dPsi) + Ux*sin(dPsi);
            ds = Ux*cos(dPsi) - Uy*sin(dPsi);
            ddPsi = r - K*Ux;
        end

        dE = -Uy*cos(psi)-Ux*sin(psi);
        dN = Ux*cos(psi) - Uy*sin(psi);
        dotPsi = r;
        
        
        
        %save data you want
        simout.deltaILC(i) = deltaILC; simout.FxILC(i) = FxILC; simout.v(i) = Ux - UxDesired;
        simout.Ux(i) = Ux; simout.Uy(i) = Uy; simout.r(i) = r; simout.s(i) = s;
        simout.UxDesired(i) = UxDesired; simout.AxDesired(i) = AxDesired; simout.brakeMode(i) = brakeMode;
        simout.posE(i) = posE; simout.posN(i) = posN; simout.psi(i) = psi;
        simout.FyF(i) = FyF; simout.FyR(i) = FyR; simout.FxF(i) = FxF; simout.FxR(i) = FxR;
        simout.FxDes(i) = FxDes; simout.FxFFW(i) = FxFFW; simout.FxST(i) = FxST;
        simout.delta(i) = delta; simout.deltaFFW(i) = deltaFFW; simout.deltaFB(i) = deltaFB;
        simout.t(i) = t; simout.beta(i) = atan(Uy/Ux); simout.e(i) = e; simout.dPsi(i) = dPsi;
        simout.alphaF(i) = alphaF; simout.alphaR(i) = alphaR; simout.alphaFdes(i) = alphaFdes; simout.alphaRdes(i) = alphaRdes;
         simout.curvature(i) = K; simout.initStatus(i) = initStatus; simout.FxFB(i) = FxFB;
        
        %perform state update and increment counter
        Uy = Uy + ts*dUy;
        r  =  r + ts*dr;
        Ux = Ux + ts*dUx;
        posE = posE + ts*dE;
        posN = posN + ts*dN;
        psi  = psi  + ts*dotPsi;
        
        if strcmp(veh.mapMatch, 'euler')
            e = e + ts*de;
            s = s + ts*ds;
            dPsi = dPsi + ts*ddPsi;
        end

        i = i + 1; t = t + ts;
        %display percent completion of simulation.
        if mod(i,100) == 0
            clc
            disp(['Simulation is ' num2str(ceil(100*s/world.s(end))) ' percent done'])
            disp(['Distance Along Path ' num2str(s) ' meters'])
        end
        
    end
    
    lapTime = simout.t(end);
    simout.N = numel(simout.t); simout.eRMS = rms(simout.e); simout.vRMS = rms(simout.v);
    disp(['Lap Time Equals ' num2str(lapTime) ' s'])
    disp(['Max Speed   Error Equals ' num2str(max(abs(simout.v)))  '/s']);
    disp(['Max Lateral Error Equals ' num2str(max(abs(simout.e))) ' m'])
end