clear all; close all; clc; 
addpath(genpath('/home/nkapania/xavier/common/'))
%% specify parameters
nt = 50; %number of steps in horizon
ts = 0.1; %step size
Ux = 10; %assume fixed Ux for lateral dynamics for now;
K = 0; %assume a straight road for now; 
[A, B, C] = getSystemMatrices(Ux, K, ts);

nx = size(A, 1); %number of states
nu = size(B, 2); %number of inputs

x0 = [0; 0; 0; 0; 0; Ux];
%state ordering: e, dPsi, beta, r, s, sdot

Q = eye(nx); 
R = eye(nu) / 10000; 
%% form concatenated matrices
Qcell = repmat({Q}, 1, nt);
Qbig = blkdiag(Qcell{:});
    
Rcell = repmat({R}, 1, nt-1);
Rbig = blkdiag(Rcell{:});
%% solve convex problem 
cvx_begin
    variable x(nx*nt, 1)
    variable u(nu*(nt-1), 1)
    minimize(x'*Qbig*x + u'*Rbig*u); %quad form 
    
    subject to
        for i = 1 : (nt-1)
           x(nx*i+1 : (i+1)*nx ) == A * x( nx*(i-1) + 1 : nx*i )  + B * u( nu*i-1 : nu*i)
        end
        x(1:nx) == x0;
        x(end) == 0; %stop at the end
        x(end-1) == 40; %stop at 30 meters

cvx_end


%% plot problem results
x = reshape(x, [nx, nt]);
e = x(1,:)';
dPsi = x(2,:)';
beta = x(3,:)';
r = x(4,:)';
s = x(5,:)'; 
sdot = x(6,:)';

u = reshape(u, [nu, nt-1]);
Fyf = u(1,:); 
Fx  = u(2,:);

plot(ts*(1:nt), e); xlabel('time (sec)'); ylabel('lat error (m)');
figure; 
plot(ts*(1:nt-1), Fyf); xlabel('time (sec)'); ylabel('lat force (N)');
figure;
plot(ts*(1:nt-1), Fx); xlabel('time (sec)'); ylabel('long force (N)');
figure;
plot(ts*(1:nt), sdot); xlabel('time (sec)'); ylabel('Speed (m/s)');
figure;
plot(ts*(1:nt), s); xlabel('time (sec)'); ylabel('s (m)');