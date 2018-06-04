function opt = getOnlineCurvatureProfile(world, velocityProfile, veh)
    %% Based directly off of N. Kapania two pass algorithm (see paper)
    %  Generate a "quick" line along a lane with KNOWN boundaries
    %  Starting from an initial line with known curvature, this algorithm
    %  minimizes the curvature using CVXgen
    %
    %  For Implementation see File CVX/cvxgen/description.cvxgen
    %
    %  CVXgen is very fast, but is limited to a small set of Sample Points
    %
    %  ...Sam


    N = numel(world.s); s= world.s; K = world.K; Ux = velocityProfile.Ux;
    psiR = world.roadPsi;
    widthLeft = world.widthLeft(1:end)';
    widthRight = world.widthRight(1:end)';
    ds = diff(world.s);
    [~, ts] = getLapTime(s, Ux);



%     disp('Generating Affine bike Models...')
    [A, B, d, aF, aR, deltaFFW, betaFFW] = getAllSys(veh, Ux, K, ts);




    %% solve convex problem
%     disp('Solving Convex Problem...')

%     % :UPDATE THIS FOR REAL IMPLEMENTATION:
%     % Set up initial vehicle states
%     beta_0  = 0;% betaFFW(1);
%     r_0     = 0;% Ux(1)*K(1);
%     delta_0 = 0;% deltaFFW(1);
%     e_0     = veh.e_0;% widthLeft(1)*3/4;
%     params.x_0 = [e_0 ;0;r_0;beta_0];


    % fill param structure
    params.x_0 = veh.x_0;
    params.delta_0 = veh.delta_0;
    params.W_psi =  1;
    params.W_delta =  1;
%     params.W_inf =  1;
    %delta_slew from original nitin calc with ds =2.5 m was 0.1
    params.delta_slew = 0.1 * ds(1)/2.5; % !!! <- This should obviously be scaled based on ds

    % ATTENTION:
    % assignInputVariable is a convenient, but very inefficient routine
    % and should be written out explicitly for final implementation
    % :ATTENTION
    params = assignInputVariable(params,A); % <-- inefficient
    params = assignInputVariable(params,B);
    params = assignInputVariable(params,d);
    params = assignInputVariable(params,ds);
    params = assignInputVariable(params,psiR);
    params = assignInputVariable(params,widthLeft);
    params = assignInputVariable(params,widthRight);


    settings.verbose = 0;

    %% run cvxGen
    disp('cvxGen runtime')
    tic
    [vars, status] = csolve(params,settings);
    % status;
    toc

    %% create output vector
    delta = zeros(N,1);
    x     = zeros(4,N);

    for iN=0:(N-1)
        name = ['x_' int2str(iN+1)];
        x(:,iN+1) = vars.(name);
        name = ['delta_' int2str(iN+1)];
        delta(iN+1,1) = vars.(name);
    end




    cvx_optval = status.optval;
    opt.feasible = cvx_optval ~= inf;
    opt.cvx_optval = cvx_optval;
    if ~opt.feasible
        error('No feasible solution found')
    end

    %% convert into returnable format
%     opt.beta_0 = beta_0;
    opt.x_cvx = x;
    %opt.A = A; opt.B = B; opt.d = d; %uncomment this if you want to save the affine tire models for each iteration.
    opt.aF = x(4,:) + veh.a*x(3,:)./Ux' - delta';
    opt.aR = x(4,:) - veh.b*x(3,:)./Ux';
    opt.e = x(1,:)';
    opt.dPsi = x(2,:)';
    opt.r = x(3,:)';
    opt.beta = x(4,:)';
    opt.s = world.s;
    opt.ts = ts;
    opt.delta = delta;
    [opt.roadE, opt.roadN] = convertPathToGlobal(world, opt.s, opt.e); % SAMQUESTION: IS THIS FLAWED, IF e IS TOO BIG?!

    % OLD version for kappa extraction - too simple at the path beginning
    %     opt.roadPsi = opt.dPsi + psiR; % <-- replaced by spline interpolation
    %     tempPsi = [psiR(1);psiR(1); psiR];
    %     tempOptPsi = [0;0; opt.dPsi];
    %     tempDs = [ds(1); ds; ds(end) ];
    %     tempK = 1./tempDs.*diff(tempPsi + tempOptPsi);
    %     opt.K = tempK(2:end); % the first value in this calculation is wrong!


    % NEW version for kappa extraction
    % spline interpolation for path curvature and Psi
    % Better results than relying on dPsi but slower!

    ppE = spline(opt.s(:), opt.roadE(:));
    ppN = spline(opt.s(:), opt.roadN(:));

    %first derivatives and second derivatives of splines
    ppEd = ppE; ppEd.coefs = ppE.coefs*diag([3 2 1],1);
    ppNd = ppN; ppNd.coefs = ppN.coefs*diag([3 2 1],1);
    ppEdd = ppEd; ppEdd.coefs = ppEd.coefs*diag([3 2 1],1);
    ppNdd = ppNd; ppNdd.coefs = ppNd.coefs*diag([3 2 1],1);

    x  = ppval(ppE , opt.s);  x1 = ppval(ppEd, opt.s); x2 = ppval(ppEdd, opt.s);
    y  = ppval(ppN , opt.s);  y1 = ppval(ppNd, opt.s); y2 = ppval(ppNdd, opt.s);

    % It is possible to unify this with convertPathToGlobal because of:
    %     wworld.roadE = x;
    %     wworld.roadN = y;

    opt.K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
    opt.roadPsi = getPsiFromEN(x, y);

end