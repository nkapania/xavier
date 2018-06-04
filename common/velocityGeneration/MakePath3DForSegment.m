function [s, Fv2, G, Mv2, Mvdot, theta] = MakePath3DForSegment(path, topoData,ds,Iz)
%MAKEPATH3D Combines the two-dimensional path data with the topography data
%to make the path 3D.
%   mapData is the map read in according to InitMap.m, topoData is topograghy
%   data as used in InitSpeedProfile.m, and ds is the desired spacing
%   between computation points.  s is a vector of distances along the path
%   that indexes the other outputs.  

% interpolate bank and grade data to spacing given by ds
totalLength = path.s(end)-path.s(1);
s = linspace(path.s(1),path.s(1) + totalLength,round(totalLength/ds));

% grade info
theta = interp1(topoData(:,1),topoData(:,2),s,'linear','extrap');    
dtheta_dsigma = interp1(topoData(:,1),topoData(:,3),s,'linear','extrap');
d2theta_dsigma2 = interp1(topoData(:,1),topoData(:,4),s,'linear','extrap');

% bank info
phi = interp1(topoData(:,1),topoData(:,5),s,'linear','extrap');
dphi_dsigma = interp1(topoData(:,1),topoData(:,6),s,'linear','extrap');
d2phi_dsigma2 = interp1(topoData(:,1),topoData(:,7),s,'linear','extrap');

% get heading data at those points
[psi, dpsi_dsigma, d2psi_dsigma2] = CalcHeadingDataForSegment(path,s);

% find the coefficients for the forces
[Fv2, ~, G] = CalcDerivatives(psi, theta, phi, dpsi_dsigma,dtheta_dsigma); 

% find the coefficients for the moments
Ib = diag([0.1*Iz 0.8*Iz Iz]);  % body frame intertia tensor
[ Mv2, Mvdot] = RotaryDerivatives(Ib, theta, phi, dpsi_dsigma,dtheta_dsigma, dphi_dsigma, d2psi_dsigma2, d2theta_dsigma2, d2phi_dsigma2);

end






