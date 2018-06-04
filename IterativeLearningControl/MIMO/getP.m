function [P, A, B1, B2] = getP(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, ts, K, AxDes)
    N = len(e);
    A = {};
    B1 = {};
    B2 = {};
    
    for i = 1:N
        [a, b] = getJacobian(e(i), dPsi(i), r(i), beta(i), v(i), UxD(i), deltaL(i), fL(i), veh, ts, K(i), AxDes(i));
        A(i)  = {a};
        
        %IMPORTANT: for numerical reasons, we convert radians to degrees
        %and Newtons to kilonewtons. This keeps values in the P matrix on
        %the same order. 
        
        B1(i) = {b(:,1)}; %convert radians to degrees
        B2(i) = {b(:,2)};     %convert Newtons to kiloNewtons};
    end
    
    C1 = [1 0 0 0 0];
    C2 = [0 0 0 0 1];
    
    
    
    
    %get matrix from delta to e
    P11 = liftSS(A, B1, C1);
    
    %get matrix from fL to e
    P12 = liftSS(A, B2, C1);
    
    %get matrix from delta to v;
    P21 = liftSS(A, B1, C2);
    
    %get matrix from fl to v;
    P22 = liftSS(A, B2, C2);
    
    %construct final P matrix;
    P = [P11 P12; P21 P22];
    
end

function P = liftSS(A, B, C)
    N = len(A);

    for j = 1:N
        foo = cell2mat(B(j));
        P(j,j) = C*foo;

        for i = (j+1):N
            P(i,j) = C*cell2mat(A(i-1))*foo;
            %if abs(P(i,j)) < 1e-5
            %    P(i,j) = 0;
            %end
            foo = cell2mat(A(i-1))*foo;
        end
    end
    
end