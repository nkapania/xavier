%Nitin Kapania
%This function outputs either an object that enables time domain simulation
%of a vehicle with a nonlinear tire model.

function [sys] = getNLsys()

a = 1.0441; 
b = 1.4248; 
m = 1.5124e+003; 
Cf = 160000; 
Cr = 180000;
Iz = 2.2499e+003;
xLA = 15.2; 
LK = .0532; 
muP = 1; 
muS = 1;
g = 9.81;
L = a+b;
FzF = m/L*(b*g); 
FzR = m/L*(a*g); 
Kug = FzF/Cf - FzR/Cr;



alphaSlideF = abs( atan(3*muP*m*b/L*9.81/Cf) );
alphaSlideR = abs( atan(3*muP*m*a/L*9.81/Cr) );
alphaFrontTable=[-alphaSlideF:.01:alphaSlideF];   % vector of front alpha (rad)
alphaRearTable=[-alphaSlideR:.01:alphaSlideR];   % vector of rear alpha (rad)

FyFtable = tireforces(Cf,muP,muS,alphaFrontTable,m*b/L*9.81);
FyRtable = tireforces(Cr,muP,muS,alphaRearTable,m*a/L*9.81);

sys.afTable = alphaFrontTable;
sys.arTable = alphaRearTable;
sys.FyFtable = FyFtable;
sys.FyRtable = FyRtable;

sys.a = a; 
sys.b = b; 
sys.m = m; 
sys.Cf = Cf; 
sys.Cr = Cr;
sys.Iz = Iz;
sys.xLA = xLA; 
sys.LK = LK; 
sys.muP = muP; 
sys.muS = muS;
sys.FzF = FzF; 
sys.FzR = FzR; 
sys.Kug = Kug;

end