function [sILC, deltaILC, FxILC] = Q_ILC_SISO(veh, sim, ts, N)

e = sim.e; v = sim.v; dIn = sim.deltaILC; fIn = sim.FxILC; s= sim.s; K = sim.curvature;
Ux = sim.Ux;

ts = ts*numel(e)/N;
disp(['Time Step for Computation: ' num2str(ts) ' s'])

%downsample to reduce computation time
idx = ceil(linspace(1, numel(e), N));
e = reshape(e(idx), [N 1]); Ux = reshape(Ux(idx), [N 1]); 
v = reshape(v(idx), [N 1]); K  = reshape(K(idx) , [N 1]);
dIn = reshape(dIn(idx), [N 1]);fIn = reshape(fIn(idx), [N 1]);
s = reshape(s(idx), [N 1]);

% compute optimal iterative learning input, assuming LTV steering dynamics

deltaILC = getDeltaILC(veh, e, Ux, K, s, ts, dIn, N);
FxILC    = getFxILC   (veh, v, ts, fIn, N);
sILC = s;

end


function deltaILC = getDeltaILC(veh, e, Ux, K, s, ts, uIn, N)

    % compute optimal iterative learning input, assuming LTV steering dynamics
    P = zeros(N);
    [A, B, C] = getAllSys(veh, Ux, K, s, ts);

    for j = 1:N
        foo = cell2mat(B(j));
        P(j,j) = C*foo;

        for i = (j+1):N
            P(i,j) = C*cell2mat(A(i-1))*foo;
            if abs(P(i,j)) < 1e-5
                P(i,j) = 0;
            end
            foo = cell2mat(A(i-1))*foo;
        end
    end

    Qlq = eye(N); Qlq = sparse(Qlq);
    Rlq = eye(N); Rlq = sparse(Rlq);
    Slq = 100*eye(N); Slq = sparse(Slq);

    Q = (P'*Qlq*P + Rlq+Slq)\(P'*Qlq*P+Slq);
    L = (P'*Qlq*P+Slq)\P'*Qlq;

    deltaILC = Q*(uIn - L*e); deltaILC(end) = 0;

end

function FxILC = getFxILC(veh, vE, ts, uIn, N)
    %P matrix is standard toeplitz matrix since we have LTI system
    Ac = -veh.Kx/veh.m; Bc = 1/veh.m; C = 1;
    [A, B] = myc2d(Ac, Bc, ts);
    
    p = C*A.^[0:N-1]*B; p = p';
    P = toeplitz(p, zeros(size(p)));
    
    Qlq = sparse(eye(N));
    Rlq = sparse(zeros(N));
    Slq = sparse(1e-7*eye(N));
    
    Q = (P'*Qlq*P + Rlq+Slq)\(P'*Qlq*P+Slq);
    L = (P'*Qlq*P+Slq)\P'*Qlq;

    FxILC = Q*(uIn - L*vE); FxILC(end) = 0;
end