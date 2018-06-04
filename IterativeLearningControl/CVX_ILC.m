function [sILC, deltaILC] = CVX_ILC(veh, e, Ux, K, s, N, uIn, ts)

ts = ts*numel(e)/N;
disp(['Time Step for Computation: ' num2str(ts) ' s'])

idx = ceil(linspace(1, numel(e), N));
E = reshape(e(idx), [N 1]); Ux = reshape(Ux(idx), [N 1]); 
U = reshape(uIn(idx), [N 1]);
sILC = reshape(s(idx), [N 1]);

% compute optimal iterative learning input, assuming LTV steering dynamics

P = zeros(N);
[A, B, C] = getAllSys(veh, Ux, K, ts);

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

d = E - P*U;

cvx_begin
    variable deltaILC(N,1)
    variable eILC(N, 1)
    
    minimize( quad_form(eILC, Qlq) + quad_form(deltaILC, Rlq) + quad_form(deltaILC - U, Slq) )
    subject to
        eILC == P*deltaILC + d
cvx_end

end
        


