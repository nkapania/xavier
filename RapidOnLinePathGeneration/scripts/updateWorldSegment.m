function [refWorld] = updateWorldSegment(refWorld, opt, bounds,indices)
    %** updates refWorld to reflect the optimization result
    %   Changes only the Section that was extracted for the optimization
    %   Moves the path according to the calculated e
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
    %   3 ONly recalculate within padding area of indices
    %
    %   ...Sam
%  [refWorld] = updateFullWorldSegment(refWorld, opt, bounds,indices);
%       return 
    
     Nfull = len(refWorld.s);
    
    %% Extract the desired portion of the track
    %  to reduce computation time in a simple way (for offline purposes)
    
    %Track Portion
    padding = 200; %elements
    indicesPad = max(1, indices(1)- padding):min(Nfull, indices(end)+padding);
    
    tempWorld.s = refWorld.s(indicesPad);
    tempWorld.roadE = refWorld.roadE(indicesPad);
    tempWorld.roadN = refWorld.roadN(indicesPad);
    tempWorld.roadPsi = refWorld.roadPsi(indicesPad);
    
    N = len(tempWorld.s);
    
    
    % SAMMOD original    e = interp1(opt.s, opt.e, refWorld.s,'cubic');
    % 1 Get new error for the newly optimized part
%     e_temp = interp1(opt.s, opt.e, refWorld.s(indices),'cubic');
    indicesTemp =  indices - (indicesPad(1)-1); % this is necessary in case indices pad is NOT the full padding away
    e_temp = interp1(opt.s, opt.e, tempWorld.s(indicesTemp),'cubic');
     e = zeros(length(tempWorld.s),1);
     e(indicesTemp) = e_temp;  % ONLY UPDATE THE WORLD SEGMENT
    % END SAMMOD

    [world.roadE, world.roadN] = convertPathToGlobal(tempWorld, tempWorld.s, e);

    world.s = zeros(N,1);
    world.s(1) = refWorld.s(indicesPad(1));
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
%     s_equidistant = linspace(refWorld.s(indicesPad(1)),refWorld.s(indicesPad(end)),length(world.s));
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

    
    %% 
    
    %do explicit assignment first to make troubleshooting easier
    refWorld.s(indicesPad) = world.s; %get original s values
    refWorld.s((indicesPad(end)+1):end) = world.s(end) + refWorld.s((indicesPad(end)+1):end); %update oncoming s values
    
    refWorld.roadE(indicesPad) = world.roadE;
    refWorld.roadN(indicesPad) = world.roadN;
    refWorld.K(indicesPad) = world.K;
    refWorld.roadPsi(indicesPad) = world.roadPsi;
    refWorld.widthRight(indicesPad) = world.widthRight;
    refWorld.widthLeft(indicesPad) = world.widthLeft;
    
    return
    
    %% PLot
    
    
        fig = figure(14); subplot 121,
        hold off; grid on; axis equal;
        plot(refWorld.roadE, refWorld.roadN,'b-')        
        hold on
        plot(world.roadE, world.roadN,'r-') 
        plot(refWorld.roadE, refWorld.roadN,'k--')      
        ylabel('N [m]')
        xlabel('E [m]')
        grid on
        plot(bounds.in(:,1), bounds.in(:,2),'k');
        plot(bounds.out(:,1), bounds.out(:,2),'k');
        %     plot(opt.roadE, opt.roadN,'r-')
        
        
    padding = 20;
    axis([min(world.roadE)-padding max(world.roadE)+padding min(world.roadN)-padding max(world.roadN)+padding]) % zoom into the desired region
    
    
        subplot 222,hold off, plot(refWorld.s,refWorld.K,'b'),hold on, stairs(world.s,world.K,'g') 
        grid on, title('Curvature \kappa')
        xlim([min(world.s) max(world.s)+40])
        
        subplot 224,hold off, plot(refWorld.s,refWorld.widthRight,'b'),hold on, stairs(world.s,world.widthRight,'g') 
        plot(refWorld.s,refWorld.widthLeft,'b'),hold on, stairs(world.s,world.widthLeft,'g') 
        grid on, title('width ')
        padding = 100;
        xlim([world.s(min(1,indices(1)-padding))  world.s(indices(end)+padding)])
        
        
%         subplot 222,hold off, plot(refWorld.s,refWorld.K,'b'),hold on, stairs(world.s,world.K,'g') 
%         grid on, title('Curvature \kappa')
%         xlim([min(world.s) max(world.s)+40])
        
        shg
    
    
end