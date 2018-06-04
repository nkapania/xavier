function [world] = updateWorldResample(refWorld, opt, bounds)
    % Updates the world from the new lateral error
    % additionally resamples the s vector to equidistant s vals
    
    
    N = len(refWorld.s);
    e = interp1(opt.s, opt.e, refWorld.s,'cubic');
    [world.roadE, world.roadN] = convertPathToGlobal(refWorld, refWorld.s, e); 
    
    world.s = zeros(N,1);
    for i = 2:N
        world.s(i) = world.s(i-1) + norm([world.roadE(i) - world.roadE(i-1); world.roadN(i) - world.roadN(i-1)]);
    end
     
    %Smooth curvature estimate by using cubic spline interpolation over
    %sparse knot points
    M = round(world.s(end)/10); %number of knot points - spaced evenly every 20 m.
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

%% set new Svalues
     s_equidistant = linspace(world.s(1),world.s(end),length(world.s));
     world.s = s_equidistant';
    
    x  = ppval(ppE , world.s);  x1 = ppval(ppEd, world.s); x2 = ppval(ppEdd, world.s);
    y  = ppval(ppN , world.s);  y1 = ppval(ppNd, world.s); y2 = ppval(ppNdd, world.s);
    
    world.roadE = x;
    world.roadN = y;
    
    world.K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
    world.roadPsi = getPsiFromEN(x, y);

    world.road_IC = [psi(1); world.roadE(1); world.roadN(1)];
    
%     world.buff = updateBuffer(world, refWorld);

    
    %recompute lane width
    world = getLaneWidth( world, bounds);
    world.isOpen = refWorld.isOpen;
    
end