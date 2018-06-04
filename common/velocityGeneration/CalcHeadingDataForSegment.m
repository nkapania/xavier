function [psi, dpsi_dsigma, d2psi_dsigma2] = CalcHeadingDataForSegment(path, sigma)
%CalcHeadingData Returns heading and its derivatives for points along a
%given map.


%function FindValue = myLinear1DInterpEMBED(xi_array, xr, zr)
%Use a lookup vector (zr) and reference vector xr to interpolate/lookup given a desired xi
psi = myLinear1DInterpEMBED(sigma,path.s, path.roadPsi); 
dpsi_dsigma = myLinear1DInterpEMBED(sigma,path.s, path.K);
d2psi_dsigma2 = [0 diff(dpsi_dsigma)./diff(sigma)];


% Old version which produces NANs
%   Vq = INTERP1(X,V,Xq) interpolates to find Vq, the values of the
%   underlying function V=F(X) at the query points Xq. X must
%   be a vector of length N.
% psi = interp1(path.s, path.roadPsi, sigma); 
% dpsi_dsigma = interp1(path.s, path.K, sigma);
% d2psi_dsigma2 = [0 diff(dpsi_dsigma)./diff(sigma)];

end


