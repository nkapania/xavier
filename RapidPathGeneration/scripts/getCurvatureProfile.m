function opt = getCurvatureProfile(world, velocityProfile, veh)
    
    %TUNABLE PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%
    lam0  = 1;  %weight on minimum curvature. should be 1 by default, but can be zero for testing purposes.
    lam1 =  1; %weight on steering regularization
    lam2 =  abs(interp1(world.lam2.s, world.lam2.weights, world.s, 'linear','extrap')); %weight on minimimum distance
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    N = numel(world.s); s= world.s; K = world.K; Ux = velocityProfile.Ux;    
    psiR = world.roadPsi;
    offset = norm([world.roadE(1) - world.roadE(N); world.roadN(1) - world.roadN(N)]);
    
     ds = diff(world.s);
    [~, ts] = getLapTime(s, Ux);

     
    disp('Generating Affine Tire Models...')
    [A, B, d] = getAllSys(veh, Ux, K, ts);
 
    disp('Solving Convex Problem...')
    cvx_begin quiet
         variable delta(N,1)
         variable x(4,N)
         
         
         %minimium curvature cost function with option to add steering
         %regularization and minimimum distance criteria.
         minimize lam0*norm( 1./ds.*(psiR(2:N) - psiR(1:N-1) + x(2,2:N)' - x(2,1:N-1)'), 2) + lam1*norm(delta(2:N)-delta(1:N-1)) + sum(  lam2(1:N-1).*(ds./Ux(1:N-1).* ( -K(1:N-1).*x(1,1:N-1)'  )   +   ds./Ux(1:N-1).*square(        x(4,1:N-1) + x(2,1:N-1)   )'  )  )
         
         
         subject to 
         
         %vehicle constraint
         for i = 1:N-1
              x(:,i+1) == cell2mat(A(i))*x(:,i)+cell2mat(B(i))*delta(i) + cell2mat(d(i));
         end
         
         %road boundary constraint
         x(1,:) <= world.widthLeft';
         x(1,:) >= world.widthRight';
         

         x(1,N) == x(1,1)- offset; %account for any small offsets
         x(2,N) == x(2,1); %continuity for dPsi, beta, and r between beginning and end.
         x(3,N) == x(3,1);
         x(4,N) == x(4,1);
         
         (x(1,N) - x(1,N-1))/ds(end) == x(1,2) - x(1,1)/ds(1); %also needed to ensure dPsi continuity - still not sure why though.
         
   cvx_end

   %opt.A = A; opt.B = B; opt.d = d; %uncomment this if you want to save the affine tire models for each iteration.
   opt.aF = x(4,:) + veh.a*x(3,:)./Ux' - delta';
   opt.aR = x(4,:) - veh.b*x(3,:)./Ux';
   opt.e = x(1,:)';
   opt.dPsi = x(2,:)';
   opt.r = x(3,:)';
   opt.roadPsi = opt.dPsi + psiR;
   opt.beta = x(4,:)'; 
   opt.s = world.s;
   opt.ts = ts;
   opt.delta = delta;
   [opt.roadE, opt.roadN] = convertPathToGlobal(world, opt.s, opt.e); 
   opt.K = 1./ds.*diff(psiR + opt.dPsi); opt.K = [opt.K(1); opt.K];
   opt.feasible = cvx_optval ~= inf;
   if ~opt.feasible
       error('No feasible solution found')
   end

end