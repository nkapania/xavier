function [world] = updateFullWorldSegment(refWorld, opt, bounds,indices)
    %** updates refWorld to reflect the optimization result
    %   Changes only the Section that was extracted for the optimization
    %   Moves the path according to the calculated e
    %   This Implementation recalculates boundaries and new positions
    %   for the FULL track. <- inefficient
    %
    %   TODO: If there is a lateral error in the first timestep, it is not
    %   accurately reflected in the new world, because of the way the roadN and
    %   roadE are smoothed. This leads to undesirable behaviour for successive
    %   iterations. Rewrite this function or assume, that the current vehicle
    %   position is on or very close to the refWorld path.
    %   ^^^^^^ this might be less of an issue in an online approach, where the
    %   path is update while the car goes along and the first timestep should
    %   have only a minor e or none at all
    %
    %   Changes compared to original version:
    %   1 only the desired segment is changed through a new e
    %   2 resample the path/world to use equidistant spaced s-Values
    %
    %   ...Sam

    N = len(refWorld.s);
     
    % SAMMOD original    e = interp1(opt.s, opt.e, refWorld.s,'cubic');
    % 1 Get new error for the newly optimized part
    e_temp = interp1(opt.s, opt.e, refWorld.s(indices),'cubic');
    e = zeros(length(refWorld.s),1);
    e(indices) = e_temp;  % ONLY UPDATE THE WORLD SEGMENT
    % END SAMMOD

    [world.roadE, world.roadN] = convertPathToGlobal(refWorld, refWorld.s, e);

    world.s = zeros(N,1);
    for i = 2:N
        world.s(i) = world.s(i-1) + norm([world.roadE(i) - world.roadE(i-1); world.roadN(i) - world.roadN(i-1)]);
    end

    %% Smooth curvature estimate by using cubic spline interpolation over
    %sparse knot points
    M = round(world.s(end)/20); %number of knot points - spaced evenly every 20 m.
    ind = ceil(linspace(1,N,M));
    ppE = spline(world.s(ind), world.roadE(ind));
    ppN = spline(world.s(ind), world.roadN(ind));

    %first derivatives and second derivatives of splines
    ppEd = ppE; ppEd.coefs = ppE.coefs*diag([3 2 1],1);
    ppNd = ppN; ppNd.coefs = ppN.coefs*diag([3 2 1],1);
    ppEdd = ppEd; ppEdd.coefs = ppEd.coefs*diag([3 2 1],1);
    ppNdd = ppNd; ppNdd.coefs = ppNd.coefs*diag([3 2 1],1);

    %get curvature and heading using ppval
    %     x  = ppval(ppE , world.s);  x1 = ppval(ppEd, world.s); x2 = ppval(ppEdd, world.s);
    %     y  = ppval(ppN , world.s);  y1 = ppval(ppNd, world.s); y2 = ppval(ppNdd, world.s);

    %% 2 set new Svalues with equidistant sampling points
    s_equidistant = linspace(world.s(1),world.s(end),length(world.s));
    world.s = s_equidistant';

    x  = ppval(ppE , world.s);  x1 = ppval(ppEd, world.s); x2 = ppval(ppEdd, world.s);
    y  = ppval(ppN , world.s);  y1 = ppval(ppNd, world.s); y2 = ppval(ppNdd, world.s);

    world.roadE = x;
    world.roadN = y;

    world.K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
    world.roadPsi = getPsiFromEN(x, y);

    world.road_IC = [psi(1); world.roadE(1); world.roadN(1)];



    %recompute lane width
    world = getLaneWidth( world, bounds);
    world.isOpen = refWorld.isOpen;

end