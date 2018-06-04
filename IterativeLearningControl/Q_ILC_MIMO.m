function [sILC, deltaILC, FxILC] = Q_ILC_MIMO(veh, sim, ts, N)

addpath('C:\Users\ddl\Desktop\nkapania\simulation\IterativeLearningControl\MIMO') 

e = sim.e; v = sim.v;  s= sim.s; K = sim.curvature; dIn = sim.deltaILC; 
dPsi = sim.dPsi; r= sim.r; beta = sim.beta; UxD = sim.UxDesired;  fIn = sim.FxILC;

%comput time step
ts = ts*numel(e)/N;
disp(['Time Step for Computation: ' num2str(ts) ' s'])

%downsample to reduce computation time
idx = ceil(linspace(1, numel(e), N));
e = reshape(e(idx), [N 1]); 
v = reshape(v(idx), [N 1]); %K  = reshape(K(idx) , [N 1]);
dIn = reshape(dIn(idx), [N 1]);fIn = reshape(fIn(idx), [N 1]);
s = reshape(s(idx), [N 1]); dPsi = reshape(dPsi(idx), [N 1]);
r = reshape(r(idx), [N 1]); beta = reshape(beta(idx), [N 1]);
UxD = reshape(UxD(idx), [N 1]);
AxDes = zeros(size(e)); % Note - since we sim without FFW for this, don't account for AxDes or K;
K     = zeros(size(e)); 

%Generate the huge-ass P matrix
disp('Generating the Huge-Ass P matrix')
P  = getP(e, dPsi, r, beta, v, UxD, dIn, fIn, veh, ts, K, AxDes);

Qd =      eye(N); Qf =      eye(N);  Qlq = sparse(blkdiag(Qd, Qf));    %gain for tracking error minimization
Rd =      eye(N); Rf =    zeros(N);  Rlq = sparse(blkdiag(Rd, Rf)) ;    %gain for input size minimization
Sd  = 100*eye(N); Sf = 1e-7*eye(N);  Slq = sparse(blkdiag(Sd, Sf)) ;                 %gain for input change reduction

Q = (P'*Qlq*P + Rlq+Slq)\(P'*Qlq*P+Slq);
L = (P'*Qlq*P+Slq)\P'*Qlq;


uOut = Q*([dIn; fIn] - L*[e; v]); uOut(end) = 0;
deltaILC = uOut(1:N);
FxILC    = uOut(N+1:2*N);
sILC = s; 

end