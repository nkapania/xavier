close all; clear all; clc;

N = 10; ts = .1; m = 10; kp = .05; kd = .5; y0 = 0;
sys = getSys(20,ts); A = sys.a; B = sys.b; C = sys.c;

%ILC without lifted domain
u1 = zeros(N,1); t1 = ts*[1:1:N]';
d1 = sin(t1);

for i = 1:m
    y1 = dLTIsim(A,B,C,u1) +d1;
    u1 = u1 - kp*y1- kd*(y1 - [y0; y1(1:N-1)]);
end

%ILC with lifted domain
u2 = zeros(N,1);  t2 = t1;
d2 = sin(t2);
for i = 1:N
    p(i) = C*A^(i-1)*B;
end

P = toeplitz(p, zeros(N,1));
L = -(kp+kd)*diag(ones(N,1)) + kd*diag(ones(N-1,1),-1);

for i = 1:m
    y2 = P*u2 +d2;
    u2 = u2 + L*y2;
end

stairs(t1, y1); hold on; stairs(t2, y2,'r')
max(abs(eig(eye(N)+L*P)))


J = P*(eye(N) + L*P)*inv(P);
s = svds(J)



