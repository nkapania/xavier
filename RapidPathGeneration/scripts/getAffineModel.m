%%Nitin Kapania

function [A B d Cf Cr] = getAffineModel(Ux, K, ts, veh, afHat, arHat)

a = veh.a; b = veh.b; m = veh.m; Cf = veh.Cf; Cr = veh.Cr; g = veh.g; L = a+b; Iz = veh.Iz;
FzF = veh.FzF; FzR = veh.FzR; muF = veh.muF; muR = veh.muR; xLA = veh.xLA; kLK = veh.kLK ;

%k1 = kLK; k2 = xLA*kLK;      %Note: In optimization, we don't want
%feedback acting.
k1 = 0; k2 = 0;

FyFhat = tireforces(Cf, muF, muF, afHat, FzF);
FyRhat = tireforces(Cr, muR, muR, arHat, FzR);
Cf = getLocalStiffness(afHat, Cf, muF, muF, FzF);
Cr = getLocalStiffness(arHat, Cr, muR, muR, FzR);


Ac = [0 Ux 0 Ux; 0 0 1 0; 
    -a*k1*Cf/Iz   -a*k2*Cf/Iz      (-a^2*Cf - b^2*Cr)/(Ux*Iz)   (b*Cr - a*Cf)/Iz;
    -k1*Cf/(m*Ux)  -k2*Cf/(m*Ux)   (b*Cr - a*Cf)/(m*Ux^2)-1     -(Cf+Cr)/(m*Ux)];

Bc = [0; 0; a*Cf/Iz; Cf/(m*Ux)]; 
dc = [0; -K*Ux; (a*Cf*afHat - b*Cr*arHat)/Iz + (a*FyFhat-b*FyRhat)/Iz; (Cf*afHat + Cr*arHat)/(m*Ux) + (FyFhat + FyRhat)/(m*Ux)];

[A B1] = myc2d(Ac, [Bc dc], ts);
B = B1(:,1);
d = B1(:,2);



end
    

