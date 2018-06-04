% Find a desired speed profile based on the path information
function vp = getVelocityProfileBG(path, veh, brakeFactor)

    % speed profile calculation parameters
    ds = 0.5;  % discretization spacing in speed profile [m]
    jerkLimit = 800; % [m/s^3] how fast the car can come off the brakes
    Vmax = 200; %arbitrary high value, taken from original base model code.
    
    topoData = [path.s path.grade path.bank];
    if sum(isnan(topoData))
        error('NaN Values Encounted in Bank and Grade Data');
    end

    [s, Fv2, G, Mv2, Mvdot, theta] = MakePath3D(path ,topoData,ds,veh.Iz);


    [ posDesired, UxDesired, AxDesired, AxMax] = FindSpeedProfile(path, veh, Vmax, s,...
        Fv2,G,Mv2,Mvdot,theta,jerkLimit,brakeFactor);

    vp.s = posDesired;
    vp.Ux = UxDesired;
    vp.Ax = AxDesired;
    vp.AxMax = AxMax;
    
    if sum(isnan(posDesired + UxDesired + AxDesired))
        error('NaN Values Encounted in Final Velocity Profile');
    end

end






