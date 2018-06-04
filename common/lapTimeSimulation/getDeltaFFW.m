%This function gets the desired FFW steering angle based on a steady state cornering force approximation,  empirical tire
%curves and vehicle kinematics.

%Nitin Kapania, 6/10/2013

function [deltaFFW,alphaFdes,alphaRdes,betaFFW] =  getDeltaFFW(K, Ux, veh)
%#codegen

    FyFdes = veh.b/veh.L*veh.m*Ux^2*K;
    FyRdes = veh.a/veh.b*FyFdes;

    %get desired front alpha using lookup table interpolation. 
    alphaFdes = force2alpha(veh.FyFtable, veh.alphaFrontTable,FyFdes);
    alphaRdes = force2alpha(veh.FyRtable, veh.alphaRearTable, FyRdes);

    betaFFW = alphaRdes + veh.b*K;
    deltaFFW = K*veh.L +alphaRdes - alphaFdes;

end
