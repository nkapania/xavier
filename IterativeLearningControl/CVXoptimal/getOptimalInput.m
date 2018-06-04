function delta = getOptimalInput(A, B, d, x0, e, deltaLast)

    lambda = 1; N = numel(A);
    
    cvx_begin
        variable x(4,N)
        variable delta(N,1)

        %minimize norm(x(1,:)+ e') + gamma*norm(delta) + lambda*norm(delta(2:N) - delta(1:N-1))
        minimize norm(x(1,:)+ e')  + lambda*norm(delta)
        subject to
            x(:,1) == x0;
            for i = 1:N-1
                x(:,i+1) == cell2mat(A(i))*x(:,i) + cell2mat(B(i))*(delta(i) +deltaLast(i)) + cell2mat(d(i));
            end
    cvx_end
    
    delta = delta + deltaLast;

end