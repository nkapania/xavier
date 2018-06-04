function [ e, s, K, psiDes, nextStartIndex, converged, iterations, smallestNorm ] = convertToLocalPath( posE, posN, startIndex, worldS, worldE, worldN, worldPsi, worldK, openWorld)
%#codegen
% Inputs:
% p_EN: (2xn) points in EN coordinate system
% p_path_seed (2xn) points in se, guess of se coords of p_EN
% init_flag: boolean, if 1 do not use p_path_seed
% world: world structure defined in LoadEnv, is the map of the environment

% Outputs:
% p_path: (2xn) points in se coordinate system

% VERY CRUDE MAPMATCHING, works with small maps

m = length(worldS);
EN = [posE; posN]; 

%number of iterations to search before terminating
REQUIRED_DISTANCE = 10;
MAX_FORWARD_ITERATIONS = 225;
MAX_BACKWARD_ITERATIONS = 75;



% go forward
lastPair = 9999999; % inf
forwardInd = startIndex;
stillDecreasing = true;
numForwardIterations = 0;

while stillDecreasing && (numForwardIterations < MAX_FORWARD_ITERATIONS)
    numForwardIterations  = numForwardIterations + 1;
    
    if forwardInd <= m-1
        currentPair = norm(EN-[worldE(forwardInd);worldN(forwardInd)]) + norm(EN-[worldE(forwardInd+1);worldN(forwardInd+1)]) ;
    else %allow searching at the beginning of the map is world is closed
        if openWorld
            currentPair = 9999999;
        else
          currentPair = norm(EN-[worldE(forwardInd);worldN(forwardInd)]) + norm(EN-[worldE(1);worldN(1)]) ;
        end
        
    end

    stillDecreasing = currentPair < lastPair;
    if stillDecreasing
        lastPair = currentPair;
        %allow searching at beginning of map if world is closed
        if forwardInd == m && ~openWorld
            forwardInd = 1; 
        else
            forwardInd = forwardInd + 1; 
        end
    end         
end

smallestF = lastPair;

% go back
lastPair = 9999999; % inf
backwardInd = startIndex;
stillDecreasing = true;
numBackwardIterations = 0;

while stillDecreasing && (numBackwardIterations < MAX_BACKWARD_ITERATIONS);
    numBackwardIterations= numBackwardIterations + 1;
    
    if backwardInd >= 2
        currentPair = norm(EN-[worldE(backwardInd);worldN(backwardInd)]) + norm(EN-[worldE(backwardInd-1);worldN(backwardInd-1)]) ;
    else %allow searching at end of map if map is closed
        if openWorld
            currentPair = 9999999;
        else
            currentPair = norm(EN-[worldE(backwardInd);worldN(backwardInd)]) + norm(EN-[worldE(m);worldN(m)]) ;
        end
    end

    stillDecreasing = currentPair < lastPair;
    if stillDecreasing
        lastPair = currentPair;
        
        %allow searching from end of the map if map is closed
        if backwardInd == 1 && ~openWorld
            backwardInd = m;
        else
            backwardInd = backwardInd - 1;
        end
    end

end

smallestB = lastPair;

if smallestB < smallestF
    if backwardInd > 1
        lowSInd = backwardInd-1;
    else
        lowSInd = m - 1; %%This should be m, but paths are defined so that the
                         % last point overlaps with the first point. This
                         % messes up the cross product, just go back one
                         % index when we cross to the next lap
    end
    highSInd = backwardInd;
else
    lowSInd = forwardInd;
    if forwardInd < m
        highSInd = forwardInd+1;
    else
        highSInd = 2; %%This should be 1, but paths are defined so that the
                         % last point overlaps with the first point. This
                         % messes up the cross product, just go up one
                         % index when we cross to the next lap
    end
end

%need to track this for initialization testing
smallestNorm = min(smallestB, smallestF);

a = norm(EN-[worldE(lowSInd);worldN(lowSInd)]);
b = norm(EN-[worldE(highSInd);worldN(highSInd)]);
c = norm([worldE(lowSInd);worldN(lowSInd)]-[worldE(highSInd);worldN(highSInd)]);

deltaS = (a^2+c^2-b^2)/(2*c);
abs_e = sqrt(abs(a^2-deltaS^2));

s = worldS(lowSInd)+deltaS;

headingVec = [-sin(worldPsi(lowSInd));cos(worldPsi(lowSInd));0];
crss = cross(headingVec,[EN;0]-[worldE(lowSInd);worldN(lowSInd);0]);

e = sign(crss(3))*abs_e;

% Compute K and Desired psi via interpolation
psiDes = worldPsi(lowSInd) + (worldPsi(highSInd) - worldPsi(lowSInd))/(worldS(highSInd) - worldS(lowSInd))*deltaS;
K =      worldK(lowSInd)   + (worldK  (highSInd) - worldK  (lowSInd))/(worldS(highSInd) - worldS(lowSInd))*deltaS;


if smallestNorm < REQUIRED_DISTANCE
    converged = true;
    nextStartIndex = lowSInd; 
    
else
    converged = false;
    nextStartIndex = startIndex + MAX_FORWARD_ITERATIONS + MAX_BACKWARD_ITERATIONS;
    %wrap around if necessary
    if nextStartIndex > m;
        nextStartIndex = 1;
    end
end     

iterations = numForwardIterations + numBackwardIterations;
         


end
