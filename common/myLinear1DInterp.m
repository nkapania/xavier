%*************************************************************************
% Filename:         myLinear1DInterp.m
% Date Created:     July 17, 2007
% Last Modified:    May 1, 2009
% Company:          General Motors
% Division:         Hybrid Powertrain
% Author:           Stephen Erlien
%*************************************************************************
function FindValue = myLinear1DInterp(xi_array, xr, zr, varargin)
%Use a lookup vector (zr) and reference vector xr to interpolate/lookup
%given a desired xi

%% Process variable inputs
[r,c] = size(varargin);
if r == 1
    extrapolate = varargin{1};
else
    extrapolate = 1;
end

%% Calculate useful metadata
xpts = max(size(xr));

% check lookup index is monotinic
if ( xr(1) > xr(xpts))
    % must be mono decrease, need to fix this
    xi_array = -1*xi_array;
    xr = -1*xr;
end

%% Set up loop in case xi is array
FindValue = zeros(size(xi_array));

for i=1:length(xi_array)
    xi = xi_array(i);
    %*************************************************************************
    %       Search x value bounds 
    %*************************************************************************
    %Check for xi lower or higher than min/max and interpolate using 2 endpoints if true
    if xi > xr(xpts) || xi < xr(1)
        if extrapolate
            INTRPVert = true;
            if xi > xr(xpts)
                x_index = xpts-1;
            else
                x_index = 1;
            end
        else
            INTRPVert = false;
            if xi > xr(xpts)
                x_index = xpts;
            else
                x_index = 1;
            end
        end
    else
    %Find points that bound xi or point that = xi
        s = 1;
        e = xpts;
        %check end points
        if xr(s) == xi
            INTRPVert = false;
            x_index = s;
        else
            if xr(e) == xi
                INTRPVert = false;
                x_index = e;
            else
                %binary search for xi in xr
                while (1)
                   if (e-s==1)
                       INTRPVert = true;
                       x_index = s;
                       break;
                   end
                   p = s + floor((e-s)/2);
                   if xr(p) == xi
                       INTRPVert = false;
                       x_index = p;
                       break;
                   else
                       if xr(p) > xi
                           e = p;
                       else
                           s = p;
                       end
                   end
                end
            end
        end
    end

    %*************************************************************************
    %       Interpolate for given situation
    %*************************************************************************
    if  ~INTRPVert
        FindValue(i) = zr(x_index);
    elseif INTRPVert
        %Interpolate over x with fixed y
        x1 = xr(x_index);
        z1 = zr(x_index);
        x2 = xr(x_index + 1);
        z2 = zr(x_index + 1);
        FindValue(i) = (z2 - z1) / (x2 - x1) * (xi - x1) + z1;
    end
end
return





%Optional Code to Implement later
% Range Checking
% if xpts < 2
%    disp('xr must be a vector')
%    FindValue = NaN;
%    return
% end
% if ~(xpts==max(size(zr)))
%    disp('xr and zr must be the same size')
%    FindValue = NaN;
%    return 
% end