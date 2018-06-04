% Find a desired speed profile based on the path information
function vp = getVelocityProfile(path, veh, mu, Vmax, brakeFactor, topoFile)

    % speed profile calculation parameters
    ds = 0.5;  % discretization spacing in speed profile [m]
    jerkLimit = 800; % [m/s^3] how fast the car can come off the brakes
    
    if nargin == 3
        Vmax = 99; brakeFactor = 1;
    end

    if nargin > 5
    
        topoData = importdata(topoFile,',',1);
        topoData = topoData.data;

        % check for discrepencies between topography and map data
        if abs(topoData(end,1) - path.s(end)) > 1
            error( 'Topography data inconsistent with map length' );
        end
        if topoData(1,1) ~= 0
            error( 'Topography data doesn''t start from zero' );
        end

    else
        
        topoData = [[0; path.s(end)], zeros(2,6)] ;
        
    end
        
    [s, Fv2, G, Mv2, Mvdot, theta] = MakePath3D(path ,topoData,ds,veh.Iz);


    [ posDesired, UxDesired, AxDesired, AxMax] = FindSpeedProfile(path, veh, mu, Vmax, s,...
        Fv2,G,Mv2,Mvdot,theta,jerkLimit,brakeFactor);

    vp.s = posDesired;
    vp.Ux = UxDesired;
    vp.Ax = AxDesired;

end






