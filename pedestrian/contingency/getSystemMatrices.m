function [A, B] = getSystemMatrices(m, ts)

    %state ordering: e, dPsi, beta, r, s, sdot

    %form combined lateral and longitudinal dynamics matrix
    Ac = [0 1; 0 0];
    Bc = [0; 1/m];
    Cc = [Clat; 0; 0];

    %discretize matrices
    [A, B1] = myc2d(Ac, [Bc Cc], ts);
    B = B1(:,1:2);
    C = B1(:,3);


end