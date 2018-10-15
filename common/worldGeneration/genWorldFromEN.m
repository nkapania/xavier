%This code generates a point cloud object from a bunch of EN points. For
%this code to work well, points should be spaced about .25 meters apart,
%must be in order, and should be relatively smooth. 

%smoothing of the EN points is accomplished by relatively stupid spline
%interpolation - we just downsample all the points by a factor of around 20
%and generate a spline that meets continuity conditions. 

function world = genWorldFromEN(posE, posN)

    N = len(posE); 

    world.s = zeros(N,1);
    world.roadN = posN;
    world.roadE = posE; 
    
    for i = 2:N
        world.s(i) = world.s(i-1) + norm([world.roadE(i) - world.roadE(i-1); world.roadN(i) - world.roadN(i-1)]);
    end

   %Smooth curvature estimate by using cubic spline interpolation over
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
    x  = ppval(ppE , world.s);  x1 = ppval(ppEd, world.s); x2 = ppval(ppEdd, world.s);
    y  = ppval(ppN , world.s);  y1 = ppval(ppNd, world.s); y2 = ppval(ppNdd, world.s);
    
    
    world.K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
    world.roadPsi = getPsiFromEN(x, y);

    world.road_IC = [world.roadPsi(1); world.roadE(1); world.roadN(1)];
    
end