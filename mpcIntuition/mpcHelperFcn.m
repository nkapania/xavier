function [x, delta] = mpcHelperFcn(A, B, x0, N, R)
%Calls cvx

disp('Solving Convex Problem...')
cvx_begin quiet
     variable delta(1, N)
     variable x(4,N)


     %standard lqr formulation - better way to do this
     minimize sum_square_abs(x(1,:)) + R*sum_square_abs(delta)
     
     subject to

     %vehicle constraint
     for i = 1:N-1
          x(:,i+1) == A*x(:,i)+B*delta(i);
     end
     
     %initial condition
     x(:,1) == x0;

cvx_end

x = x; %transpose results

end

