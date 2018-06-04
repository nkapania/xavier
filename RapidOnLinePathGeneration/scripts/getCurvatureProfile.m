function opt = getCurvatureProfile(world, velocityProfile, veh)
    
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
         
         
         %min curvature with a bit of regularization to prevent steering
         %oscillations
         minimize norm( 1./ds.*(psiR(2:N) - psiR(1:N-1) + x(2,2:N)' - x(2,1:N-1)'), 2) + 1*norm(delta(2:N)-delta(1:N-1)) 
         
         subject to 
         
         %vehicle constraint
         for i = 1:N-1
              x(:,i+1) == cell2mat(A(i))*x(:,i)+cell2mat(B(i))*delta(i) + cell2mat(d(i));
         end
         
         %road boundary constraint
         x(1,:) <= world.widthLeft';
         x(1,:) >= world.widthRight';
         

         x(1,N) == x(1,1); %- offset; %account for any small offsets  % SAMQUESTION: IS THIS A DESIRABLE CONSTRAINT? DOESNT IT LEAD TO ENFORCING THE ORIGINAL CURVATURE AT THE START/FINISH LINE
         %x(2,N) == x(2,1); %continuity for dPsi, beta, and r between beginning and end.
         x(3,N) == x(3,1);
         x(4,N) == x(4,1);
         
         % SAMQUESTION: shouldnt this be (x(1,1) - x(1,N))/"dsLastToFirst" ? this way, one step is ignored and could be off 
         % Does enforcing "x(1,N) == x(1,1);" lead to the curvature being
         % that of the original path and maybe causing problems?
         (x(2,1) - x(2,N))/ds(end) == (x(2,2) - x(2,1))/ds(1); %also needed to ensure dPsi continuity - still not sure why though.
          
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