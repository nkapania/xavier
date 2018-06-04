function [E, N] = convertPathToGlobal( world,s,e )
% converts s and e vectors along a path defined by world into EN global coordinates
n = length(s);
E = zeros(n,1);
N = zeros(n,1);

% for i=1:n
%     if( s(i)>world.roadLength && world.closedMap )
%         s(i) = s(i)-world.roadLength; 
%     end
% end

centE = myLinear1DInterp(s,world.s,world.roadE);
centN = myLinear1DInterp(s,world.s,world.roadN);
theta = myLinear1DInterp(s,world.s,world.roadPsi);
for i=1:n
    E(i) = centE(i) - e(i)*sin(pi/2-theta(i));
    N(i) = centN(i) - e(i)*cos(pi/2-theta(i));
    
end

end

