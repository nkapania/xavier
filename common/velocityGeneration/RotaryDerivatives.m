function [ Mv2, Mvdot] = RotaryDerivatives( Ib, theta, phi, dpsi_dsigma,...
    dtheta_dsigma, dphi_dsigma, d2psi_dsigma2, d2theta_dsigma2, d2phi_dsigma2)
    %RotaryDerivatives Calculates coefficients for V^2 and Vdot in the moment
    %equation
    %   Detailed explanation goes here

    n = length(phi);
    % make dimensions compatible
    theta = reshape(theta,1,n);
    phi = reshape(phi,1,n);
    dpsi_dsigma = reshape(dpsi_dsigma,1,n);
    dtheta_dsigma = reshape(dtheta_dsigma,1,n);
    dphi_dsigma = reshape(dphi_dsigma,1,n);
    d2psi_dsigma2 = reshape(d2psi_dsigma2,1,n);
    d2theta_dsigma2 = reshape(d2theta_dsigma2,1,n);
    d2phi_dsigma2 = reshape(d2phi_dsigma2,1,n);

    %path coordinate derivatives
    dphi_ds = dphi_dsigma .*cos(theta);
    dtheta_ds = dtheta_dsigma .*cos(theta);
    dpsi_ds = dpsi_dsigma .*cos(theta);
    d2phi_ds2 = cos(theta).*(d2phi_dsigma2.*cos(theta) - dphi_dsigma.*dtheta_dsigma.*sin(theta));
    d2theta_ds2 = cos(theta).*(d2theta_dsigma2.*cos(theta) - (dtheta_dsigma.^2).*sin(theta));
    d2psi_ds2 = cos(theta).*(d2psi_dsigma2.*cos(theta) - dpsi_dsigma.*dtheta_dsigma.*sin(theta));

    V2a = zeros(3,n);
    V2b = zeros(3,n);
    V2c = zeros(3,n);
    Mvdot = zeros(3,n);
    for i = 1:n
        L_BI = [1 0 -sin(theta(i)); 0 cos(phi(i)) sin(phi(i))*cos(theta(i));...
            0 -sin(phi(i)) cos(phi(i))*cos(theta(i))];
        wb = L_BI * [dphi_ds(i); dtheta_ds(i); dpsi_ds(i)];
        wbtilde = [0 -wb(3) wb(2); wb(3) 0 -wb(1); -wb(2) wb(1) 0];
        V2a(:,i) = wbtilde*Ib*wb;

        V2c(:,i) = Ib*L_BI*[d2phi_ds2(i); d2theta_ds2(i); d2psi_ds2(i)];

        Mvdot(:,i) = Ib*L_BI*[dphi_ds(i); dtheta_ds(i); dpsi_ds(i)];

        L_BIdot = [0 0 -cos(theta(i))*dtheta_ds(i);...
            0 (-sin(phi(i))*dphi_ds(i)) (cos(phi(i))*cos(theta(i))*dphi_ds(i) - sin(phi(i))*sin(theta(i))*dtheta_ds(i));
            0 (-cos(phi(i))*dphi_ds(i)) (-sin(phi(i))*cos(theta(i))*dphi_ds(i) - cos(phi(i)) * sin(theta(i))*dtheta_ds(i))];
        V2b(:,i) = Ib*L_BIdot*[dphi_ds(i); dtheta_ds(i); dpsi_ds(i)];
    end
    Mv2 = V2a + V2b + V2c;
    
end