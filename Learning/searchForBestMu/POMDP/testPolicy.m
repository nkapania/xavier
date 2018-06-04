%% Nitin Kapania
% This code runs through a dataset and applies the POMDP policy to
% determine the best friction value to operate the car at. Belief updates
% are done with a simple discrete state filter. 

clear all; close all; clc;
load pi1.mat; %load optimal policy from SARSOP algorithm. 
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'))
veh = getVehicle('nonlinear','embed');
pd = getProblemData(10, 4540);

load C:\Users\ddl\Desktop\nkapania\simulation\common\maps\thunderhill_race.mat; path = mapWorld; path.isOpen = 0;

maxMu = .99; ts = .01; veh1 = veh; veh1.powerLimit = Inf;
vp = getVelocityProfileBG(path, veh1, maxMu, 99, 1);


%%

Ux = vp.Ux(1); Uy = 0; r = 0;
psi = mapWorld.roadPsi(2); posE = mapWorld.roadE(2); posN = mapWorld.roadN(2); 
B = [.5; .5]; muCommand = .9; %belief state set to uniform

i = 1; t = 0;
clear mapMatch; clear mapMatchEMBED

while true
    [e, dPsi, K, s, dst2end, initStatus] = mapMatchEMBED(posE, posN, psi, mapWorld.s, mapWorld.roadE, mapWorld.roadN, mapWorld.roadPsi, mapWorld.K, mapWorld.isOpen);
    
    if s > mapWorld.s(end) - .55; break; end
    
    if abs(e) > 5
         disp('Car has gone off the track')
         break;
    elseif isnan(s)
         disp('NaN Values Encountered ... terminating')
         break;
    end
    
    [deltaFFW,alphaFdes,alphaRdes,betaFFW] =  getDeltaFFW(K, Ux, veh);    
    deltaFB = -veh.kLK*(e + veh.xLA*sin(dPsi+betaFFW));
    
    delta = deltaFB + deltaFFW;
    
    if Ux < 2
        alphaF = 0;
        alphaR = 0;
    else
        alphaF = atan((Uy + veh.a*r)/Ux) - delta;
        alphaR = atan((Uy - veh.b*r)/Ux);
    end
    
    if initStatus
        [FxFFW, FxDrag, FxST, UxDesired, AxDesired, brakeMode, B, muCommand] =  getFxPOMDP(s, Ux, r, delta,vp, veh.Kx, maxMu, veh, mapWorld.isOpen, B, muCommand, pd, alphaF, pi1);
    else
        FxFFW = 0; FxDrag =0; FxST = 0; UxDesired = 0; AxDesired = 0;
    end
    
    FxDes = FxFFW + FxST;
    [FxF, FxR] = getFx(FxDes, Ux, veh);    
    FyF = coupledTireForces(alphaF, FxF, veh, 'front');
    FyR = coupledTireForces(alphaR, FxR, veh, 'rear' );  
    
    %update states
    dUy = (FyF + FyR)/veh.m - r*Ux;
    dr = (veh.a*FyF - veh.b*FyR)/veh.Iz;
    dUx = Uy*r + (FxF + FxR - FyF*delta)/veh.m;
    
    dE = -Uy*cos(psi)-Ux*sin(psi);
    dN = Ux*cos(psi) - Uy*sin(psi);
    dotPsi = r;
    
    %save data you want
    simout.v(i) = Ux - UxDesired;
    simout.Ux(i) = Ux; simout.Uy(i) = Uy; simout.r(i) = r; simout.s(i) = s;
    simout.UxDesired(i) = UxDesired; simout.AxDesired(i) = AxDesired; simout.brakeMode(i) = brakeMode;
    simout.posE(i) = posE; simout.posN(i) = posN; simout.psi(i) = psi;
    simout.FyF(i) = FyF; simout.FyR(i) = FyR; simout.FxF(i) = FxF; simout.FxR(i) = FxR;
    simout.FxDes(i) = FxDes; simout.FxFFW(i) = FxFFW; simout.FxST(i) = FxST;
    simout.delta(i) = delta; simout.deltaFFW(i) = deltaFFW; simout.deltaFB(i) = deltaFB;
    simout.t(i) = t; simout.beta(i) = atan(Uy/Ux); simout.e(i) = e; simout.dPsi(i) = dPsi;
    simout.alphaF(i) = alphaF; simout.alphaR(i) = alphaR; simout.alphaFdes(i) = alphaFdes; simout.alphaRdes(i) = alphaRdes;
    simout.curvature(i) = K; simout.initStatus(i) = initStatus; simout.B(i,:) = B; simout.muCommand(i) = muCommand;
    
    %perform state update and increment counter
    Uy = Uy + ts*dUy;
    r  =  r + ts*dr;
    Ux = Ux + ts*dUx;
    posE = posE + ts*dE;
    posN = posN + ts*dN;
    psi  = psi  + ts*dotPsi;
    
    i = i + 1; t = t + ts;
    %display percent completion of simulation.
    if mod(i,100) == 0
        clc
        disp(['Simulation is ' num2str(ceil(100*s/mapWorld.s(end))) ' percent done'])
        disp(['Distance Along Path ' num2str(s) ' meters'])
    end
    
end

%%
figure
plot(simout.s, simout.muCommand)
xlabel('Distance Along Path (m)');
ylabel('Optimal Mu Value');