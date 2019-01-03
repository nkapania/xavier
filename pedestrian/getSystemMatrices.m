function [A, B, C] = getSystemMatrices(Ux, K, ts)

    %%vehicle parameters

    Cf = 150000; %N / rad
    Cr = Cf;
    m = 1500; %kg
    b = 1.25; %m
    a = 1.25; 
    Iz = m*a*b;

    %% form lateral dynamics matrix
    Alat = [0 Ux Ux 0; 0 0 0 1; 0 0 -Cr/(m*Ux) b*Cr/(m*Ux^2)-1; 0 0 b*Cr/Iz -Cr*b^2/(Iz*Ux)];
    Blat = [0; 0; 1/(m*Ux); a/Iz];
    Clat = [0; -K*Ux; 0; 0];

    %state ordering: e, dPsi, beta, r, s, sdot

    %form combined lateral and longitudinal dynamics matrix
    Ac = blkdiag(Alat, [0 1; 0 0]);
    Bc = blkdiag(Blat, [0; 1/m]);
    Cc = [Clat; 0; 0];

    %discretize matrices
    [A, B1] = myc2d(Ac, [Bc Cc], ts);
    B = B1(:,1:2);
    C = B1(:,3);


end