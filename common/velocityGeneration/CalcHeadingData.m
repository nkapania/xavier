function [psi, dpsi_dsigma, d2psi_dsigma2] = CalcHeadingData(path, sigma)
%CalcHeadingData Returns heading and its derivatives for points along a
%given map.

psi = interp1(path.s, path.roadPsi, sigma); 
dpsi_dsigma = interp1(path.s, path.K, sigma);
d2psi_dsigma2 = [0 diff(dpsi_dsigma)./diff(sigma)];

end


