function [Ad, Bd] = myc2d(A, B, ts)
%#codegen
    [m,n] = size(A); 
    [m,nb] = size(B); 
    s = expm([[A B]*ts; zeros(nb,n+nb)]);
    Ad = s(1:n,1:n);
    Bd = s(1:n,n+1:n+nb);
end