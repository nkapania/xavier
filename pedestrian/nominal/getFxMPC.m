function [Fx, u, sOpt, UxOpt, s1, s2] = getFxMPC(m, ts, nt, x0, xP, uBounds)

%form combined lateral and longitudinal dynamics matrix
Ac = [0 1; 0 0];
Bc = [0; 1];

%discretize matrices
[A, B] = myc2d(Ac, Bc, ts);

nx = size(A,1);
nu = size(B,2);

Q = eye(nx);
R = 10*eye(nu);

Qcell = repmat({Q}, 1, nt);
Qbig = blkdiag(Qcell{:});

Rcell = repmat({R}, 1, nt-1);
Rbig = blkdiag(Rcell{:});

lam1 = 100000;
lam2 = 100000;

%% solve convex problem 
cvx_begin
    variable x(nx*nt, 1)
    variable u(nu*(nt-1), 1)
    variable s1 %slack on no positive acceleration - needed to creep up to stop;
    variable s2 %slack on no acceleration below a certain value
    minimize(x'*Qbig*x + u'*Rbig*u + s1*lam1 + s2*lam2); %quad form 
    
    subject to
        for i = 1 : (nt-1)
           %x(nx*i+1 : (i+1)*nx ) == A * x( nx*(i-1) + 1 : nx*i )  + B * u( nu*i-1 : nu*i);
           x(nx*i+1 : (i+1)*nx ) == A * x( nx*(i-1) + 1 : nx*i )  + B * u(nu*i); %for case where nu = 1
        end
        x(1:nx) == x0; %initial condition
        x(end-1) <= xP; %stop at desired position
        x(end-1) >= xP-2; %stop at desired position
        x(end) == 0; %stop at the end
        x >= 0;
        u + s2 >= uBounds(1);
        u <= uBounds(2) + s1;
        s1 >= 0;
        s2 >= 0;
        

cvx_end

Fx = u(1);
x = reshape(x, [nx, nt]);
sOpt = x(1,:);
UxOpt = x(2,:); 

end