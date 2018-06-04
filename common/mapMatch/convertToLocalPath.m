function [ p_path ] = convertToLocalPath( p_EN,p_path_seed,init_flag,world )
%#codegen
% Inputs:
% p_EN: (2xn) points in EN coordinate system
% p_path_seed (2xn) points in se, guess of se coords of p_EN
% init_flag: boolean, if 1 do not use p_path_seed
% world: world structure defined in LoadEnv, is the map of the environment

% Outputs:
% p_path: (2xn) points in se coordinate system

% VERY CRUDE MAPMATCHING, works with small maps

[~,n] = size(p_EN);
p_path = zeros(2,n);
s = world.s;
m = length(s);

if init_flag
    % run through all point to find min dis
    p_seed = zeros(2,n);
    
    for j=1:n
        dist = zeros(length(s),1);
        for i=1:length(s)
            % distance from p_EN to every mapped point on road
            dist(i) = norm(p_EN(:,j)-[world.roadE(i);world.roadN(i)]);
        end
        
        [abs_e,index] = min(dist);
        p_path(1,j) = s(index);
        % to determine sign of e, cross heading vector with vector from point to road
        % append vectors with 0 to get 3 dims for convenient use of cross
        % unit vector of heading in world frame
        headingVec = [-sin(world.roadPsi(index));cos(world.roadPsi(index));0];
        crss = cross(headingVec,[p_EN(:,j);0]-[world.roadE(index);world.roadN(index);0]);
        p_path(2,j) = sign(crss(3))*abs_e;
        
    end
    
    % now call mapmatching again with seed
    %p_path = convertToLocalPath(p_EN,p_seed,0,world);
    
else
    for j=1:n
         s_startIndex = find(s>p_path_seed(1,j)); % crude
         if isempty(s_startIndex)
             s_startIndex = 1;
         end
         s_startIndex = s_startIndex(1);
         % go forward
         lastPair = 9999999; % inf
         forwardInd = s_startIndex;
         stillDecreasing = true;
         while stillDecreasing
             if forwardInd+1 <= m-1
                 currentPair = norm(p_EN(:,j)-[world.roadE(forwardInd);world.roadN(forwardInd)]) + ...
                     norm(p_EN(:,j)-[world.roadE(forwardInd+1);world.roadN(forwardInd+1)]) ;
             else
                 currentPair = 9999999;
             end
             
             stillDecreasing = currentPair < lastPair;
             if stillDecreasing
                lastPair = currentPair;
                forwardInd = forwardInd + 1; 
             end         
         end
         smallestF = lastPair;
              
         % go back
         lastPair = 9999999; % inf
         backwardInd = s_startIndex;
         stillDecreasing = true;
         while stillDecreasing
             if backwardInd-1 >= 2
             currentPair = norm(p_EN(:,j)-[world.roadE(backwardInd);world.roadN(backwardInd)]) + ...
                 norm(p_EN(:,j)-[world.roadE(backwardInd-1);world.roadN(backwardInd-1)]) ;
             else
                 currentPair = 9999999;
             end
                         
             stillDecreasing = currentPair < lastPair;
             if stillDecreasing
                lastPair = currentPair;
                backwardInd = backwardInd - 1;   
             end
                      
         end
         smallestB = lastPair;
         
         if smallestB < smallestF
             lowSInd = backwardInd-1;
             highSInd = backwardInd;
         else
             lowSInd = forwardInd;
             highSInd = forwardInd+1;
         end
         
         a = norm(p_EN(:,j)-[world.roadE(lowSInd);world.roadN(lowSInd)]);
         b = norm(p_EN(:,j)-[world.roadE(highSInd);world.roadN(highSInd)]);
         c = norm([world.roadE(lowSInd);world.roadN(lowSInd)]-[world.roadE(highSInd);world.roadN(highSInd)]);
         
         deltaS = (a^2+c^2-b^2)/(2*c);
         abs_e = sqrt(abs(a^2-deltaS^2));
         
         p_path(1,j) = s(lowSInd)+deltaS;
         
         headingVec = [-sin(world.roadPsi(lowSInd));cos(world.roadPsi(lowSInd));0];
         crss = cross(headingVec,[p_EN(:,j);0]-[world.roadE(lowSInd);world.roadN(lowSInd);0]);
         p_path(2,j) = sign(crss(3))*abs_e;
         
         
         
         
    end
end


end
