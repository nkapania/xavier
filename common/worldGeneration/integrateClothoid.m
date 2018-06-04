function [ roadE, roadN, roadPsi, roadK, s, endPoint ] = integrateClothoid( IC, kIn, sIn , endFlag)
% s is path length, heading is theta, absolute angle

options = odeset('RelTol',1e-5,'MaxStep',1);
[s,z] = ode45(@curvatureProp,sIn, IC, options);

roadPsi = z(:,1);
roadE = z(:,2);
roadN = z(:,3);

roadK = zeros(size(s));
for i = 1:len(roadK)
    roadK(i) = interp1(sIn, kIn, s(i));
end


%To avoid double counting - remove end values, unless we are at the end;
endPoint = [roadPsi(end); roadE(end); roadN(end)];

if ~endFlag
    roadE = roadE(1:end-1); roadN = roadN(1:end-1); roadPsi = roadPsi(1:end-1);
    roadK = roadK(1:end-1); s = s(1:end-1);
end


    function [ dZ ] = curvatureProp( s,Z )
        K = interp1(sIn, kIn, s);
        theta = Z(1);
        % for theta CCW from N
        dZ = [K;-sin(theta);cos(theta)];
        
    end

end

