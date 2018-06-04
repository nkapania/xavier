%%Nitin Kapania

function [A, B] = getAffineModel(Ux, ts, veh, aF, aR, Cf, Cr, muF, muR)

a = veh.a; b = veh.b; m = veh.m; Iz = veh.Iz;
FzF = veh.FzF; FzR = veh.FzR; xLA = veh.xLA; kLK = veh.kLK ; k1 = kLK; k2 = xLA*kLK;

if ~strcmp(veh.tireType , 'linear')
    Cf = getLocalStiffness(aF, Cf, muF, muF, FzF);
    Cr = getLocalStiffness(aR, Cr, muR, muR, FzR);
end


Ac = [0 Ux 0 Ux; 0 0 1 0; 
    -a*k1*Cf/Iz   -a*k2*Cf/Iz      (-a^2*Cf - b^2*Cr)/(Ux*Iz)   (b*Cr - a*Cf)/Iz;
    -k1*Cf/(m*Ux)  -k2*Cf/(m*Ux)   (b*Cr - a*Cf)/(m*Ux^2)-1     -(Cf+Cr)/(m*Ux)];

Bc = [0; 0; a*Cf/Iz; Cf/(m*Ux)]; 

[A, B] = myc2d(Ac, Bc, ts);

end
    

