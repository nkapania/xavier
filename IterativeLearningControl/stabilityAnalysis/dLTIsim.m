function y = dLTIsim(A,B,C,u)

    x = zeros(numel(A(:,1)), 1);
    N = numel(u); y = zeros(N,1);
    
    for i = 1:N
        x = A*x + B*u(i);
        y(i) = C*x;
    end
end
        
    
    
    