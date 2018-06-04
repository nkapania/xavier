%computes lateral tire slip.

function [alpha] = slips(state, vehicle, delta)

Uy = state(1);
r = state(2);
Ux = state(3);
a = vehicle.a;
b = vehicle.b;

alphaF = atan((Uy + a*r)/Ux) - delta;
alphaR = atan((Uy - b*r)/Ux);

alpha = [alphaF; alphaR];


end

        
        
    
