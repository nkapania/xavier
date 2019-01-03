clear all; close all; clc; 
addpath(genpath('/home/nkapania/xavier/common/'))
%% specify parameters
nt = 50; %number of steps in horizon
ts = 0.1; %step size
[A, B, C] = getSystemMatrices(ts);

nx = size(A, 1); %number of states
nu = size(B, 2); %number of inputs

x0 = [0; 0; 0; 0; 0; Ux];
%state ordering: e, dPsi, beta, r, s, sdot

Q = eye(nx); 
R = eye(nu); 
%% form concatenated matrices
Qcell = repmat({Q}, 1, nt);
    Qbig = blkdiag(Qcell{:});
    
Rcell = repmat({R}, 1, nt-1);
    Rbig = blkdiag(Rcell{:});

Acell = repmat({A},1, nt-1);
    Abig = blkdiag(Acell{:});

Bcell = repmat({B}, 1, nt-1);
    Bbig = blkdiag(Bcell{:});
    
%% solve convex problem 
cvx_begin
    variable x(nx*nt, 1)
    variable u(nu*(nt-1), 1)
    minimize(x'*Qbig*x + u'*Rbig*u); %quad form 
    
    subject to
        x(nx+1:end) == Abig*x(1:end-nx) + Bbig*u; %system dynamics
        x(1:nx) == x0; %%initial conditions

cvx_end


%% plot problem results
x = reshape(x, [nx, nt]);
e = x(1,:)';
dPsi = x(2,:)';
beta = x(3,:)';
r = x(4,:)';
s = x(5,:)'; 
sdot = x(6,:)';

plot(sdot);
