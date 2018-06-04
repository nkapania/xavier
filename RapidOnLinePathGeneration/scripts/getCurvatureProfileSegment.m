function opt = getCurvatureProfileSegment(world, velocityProfile, veh)
%% This implementation of getCurvatureProfile uses the same formulation
%  that is used for the CVXgen implementation.
%  it is beeing used to compare the CVXgen results to a result achieved
%  with traditional CVX
%  Since CVX can deal with bigger problems, it accepts more sample points
%  Plus: it can be used to play around with the formulation without having
%  to run CVXgen.com
%  Original Code by N.Kapania, Modified by Sam Schacher



N = numel(world.s); s= world.s; K = world.K; Ux = velocityProfile.Ux;
psiR = world.roadPsi;
offset = norm([world.roadE(1) - world.roadE(N); world.roadN(1) - world.roadN(N)]);

ds = diff(world.s);
[~, ts] = getLapTime(s, Ux);


% disp('Generating Affine Tire Models...')
[A, B, d, aF, aR, deltaFFW, betaFFW] = getAllSys(veh, Ux, K, ts);




% UPDATE THIS FOR REAL IMPLEMENTATION
% beta_0 = 0;% betaFFW(1);
% r_0 =    0;% Ux(1)*K(1);
% delta_begin = 0;% deltaFFW(1);
% e_0 =  veh.e_0;% world.widthLeft(1)*3/4;

delta_begin = veh.delta_0;
    
x_begin = veh.x_0;
delta_slew = 0.01;
W_psi = 0.5;
W_delta = 1;
W_inf = 1;


disp('Solving Convex Problem...')
tic
cvx_begin quiet
    variable delta(N,1)
    variable x(4,N)

    variable kappa(N, 1);


    %min curvature with a bit of regularization to prevent steering
    %oscillations
%   with 2 norm  minimize(W_inf*norm(kappa, inf) + quad_form(kappa(1:N), W_psi) + quad_form(delta(2:N) - delta(1:N-1), W_delta) )
    minimize(W_inf*norm(kappa, inf) + norm(kappa(1:N)*W_psi,1) + quad_form(delta(2:N) - delta(1:N-1), W_delta) )
    %minimize  norm( 1./ds.*(psiR(2:N) - psiR(1:N-1) + x(2,2:N)' - x(2,1:N-1)'), 2) + 1*norm(delta(2:N)-delta(1:N-1)))

    subject to

    %vehicle constraint
    for i = 1:N-1
        x(:,i+1) == cell2mat(A(i))*x(:,i)+cell2mat(B(i))*delta(i) + cell2mat(d(i));

        kappa(i+1) == 1./ds(i).*(psiR(i+1) - psiR(i) + x(2,i+1)' - x(2,i)') ;


    end

%     kappa(1) == 0 ;

%     delta(1) == delta_begin;
    abs(delta(1) - delta_begin) <= delta_slew;
    abs(delta(2:N) - delta(1:N-1)) <= delta_slew;

    %road boundary constraint
    x(1,:) <= world.widthLeft';
    x(1,:) >= world.widthRight';

    x(:,1) == x_begin; % initial conditions
    x(1,end) == 0;  % final conditions
    x(2,end) == 0;

    %         x(1,N) == x(1,1)- offset; %account for any small offsets
    %         x(2,N) == x(2,1); %continuity for dPsi, beta, and r between beginning and end.
    %         x(3,N) == x(3,1);
    %         x(4,N) == x(4,1);

    %% ?? SAMQUESTION -> shouldn't the right side be in parantecese as well?
%     (x(1,N) - x(1,N-1))/ds(end) == (x(1,2) - x(1,1))/ds(1); %also needed to ensure dPsi continuity - still not sure why though.

cvx_end
toc
% opt.beta_0 = beta_0;
opt.x_cvx = x;

%opt.A = A; opt.B = B; opt.d = d; %uncomment this if you want to save the affine tire models for each iteration.
opt.aF = x(4,:) + veh.a*x(3,:)./Ux' - delta';
opt.aR = x(4,:) - veh.b*x(3,:)./Ux';
opt.e = x(1,:)';
opt.dPsi = x(2,:)';
opt.r = x(3,:)';
opt.roadPsi = opt.dPsi + psiR; % <-- Replaced by spline interpolation
opt.beta = x(4,:)';
opt.s = world.s;
opt.ts = ts;
opt.delta = delta;
[opt.roadE, opt.roadN] = convertPathToGlobal(world, opt.s, opt.e);
opt.K = 1./ds.*diff(psiR + opt.dPsi); opt.K = [opt.K(1); opt.K]; 
opt.feasible = cvx_optval ~= inf;
opt.cvx_optval = cvx_optval;
if ~opt.feasible
    error('No feasible solution found')
end


%     %% testing spline interpolation for path curvature
%     
%     ppE = spline(opt.s(:), opt.roadE(:));
%     ppN = spline(opt.s(:), opt.roadN(:));
%     
%     %first derivatives and second derivatives of splines
%     ppEd = ppE; ppEd.coefs = ppE.coefs*diag([3 2 1],1);
%     ppNd = ppN; ppNd.coefs = ppN.coefs*diag([3 2 1],1); 
%     ppEdd = ppEd; ppEdd.coefs = ppEd.coefs*diag([3 2 1],1);
%     ppNdd = ppNd; ppNdd.coefs = ppNd.coefs*diag([3 2 1],1); 
%     
%     x  = ppval(ppE , opt.s);  x1 = ppval(ppEd, opt.s); x2 = ppval(ppEdd, opt.s);
%     y  = ppval(ppN , opt.s);  y1 = ppval(ppNd, opt.s); y2 = ppval(ppNdd, opt.s);
%     
% %     wworld.roadE = x;
% %     wworld.roadN = y;
%     
%     opt.K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
%     opt.roadPsi = getPsiFromEN(x, y);


end