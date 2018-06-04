function[Fv2, Fvdot, G] = CalcDerivatives(psi, theta, phi, dpsi_dsigma, dtheta_dsigma)
        
    %CalcDerivatives returns vectors for acclerations in the body frame
    %   Fv2 is the pointwise acceleration from curvature. Fvdot is the
    %   acceleration from gas/brake and is [1;0;0] in every column.  G is the
    %   direction of gravity in the body frame (positive down).  
    n = length(psi);
    % make matrix dimensions compatible
    psi = reshape(psi,1,n);
    theta = reshape(theta,1,n);
    phi = reshape(phi,1,n);
    dpsi_dsigma = reshape(dpsi_dsigma,1,n);
    dtheta_dsigma = reshape(dtheta_dsigma,1,n);

    % path coordinate derivatives
    dx_ds = cos(theta).*cos(psi);
    dy_ds = cos(theta).*sin(psi);
    dz_ds = -sin(theta);

    dx2_ds2 = - sin(theta).*cos(theta).*cos(psi).*dtheta_dsigma - (cos(theta).^2).*sin(psi).*dpsi_dsigma;
    dy2_ds2 = (cos(theta).^2).*cos(psi).*dpsi_dsigma - sin(theta).*cos(theta).*sin(psi).*dtheta_dsigma;
    dz2_ds2 = -(cos(theta).^2).*dtheta_dsigma;

    %initialize output variables
    Fv2 = zeros(3,n); Fvdot = zeros(3,n); G = zeros(3,n);
    % transform to body frame using rotaion matrix M_BI
    for i = 1:length(psi)
        M_1I = [cos(psi(i)) sin(psi(i)) 0; -sin(psi(i)) cos(psi(i)) 0; 0 0 1];
        M_21 = [cos(theta(i)) 0 -sin(theta(i)); 0 1 0; ...
            sin(theta(i)) 0 cos(theta(i))];
        M_B2 = [1 0 0; 0 cos(phi(i)) sin(phi(i)); 0 -sin(phi(i)) cos(phi(i))];
        M_BI = M_B2*M_21*M_1I;
        Fv2(:,i) = M_BI * [dx2_ds2(i); dy2_ds2(i); dz2_ds2(i)];
        Fvdot(:,i) = M_BI * [dx_ds(i); dy_ds(i); dz_ds(i)];
        G(:,i) = M_BI * [0; 0; 9.81];
    end
    
end


