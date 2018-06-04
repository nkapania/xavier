function optResult = getRapidOnlineTrajectory(refWorld, vpRef, veh, N_CVX)
%% downsample world and velocity profile objects for optimization
%  And call the CVXgen function
%
% Downsamples the world with a fixed amount of sample points.
% The sampling stepsize is equal to lookaheadDistance/lookaheadPoints
% lookaheadPoints has to match the paramaeter in the CVX formulation
%
% ...Sam

lookaheadPoints = N_CVX;
world = downsampleWorldFixedn(refWorld,lookaheadPoints); 

% extract the velocity profile for the segment
velocityProfile.s = world.s;
velocityProfile.Ux = myLinear1DInterpEMBED(velocityProfile.s, vpRef.s, vpRef.Ux);
velocityProfile.Ax = myLinear1DInterpEMBED(velocityProfile.s, vpRef.s, vpRef.Ax);

% old interpolation method
%     velocityProfile.Ux = interp1(vpRef.s, vpRef.Ux, velocityProfile.s);
%     velocityProfile.Ax = interp1(vpRef.s, vpRef.Ax, velocityProfile.s);



 

optResult = getOnlineCurvatureProfile(world, velocityProfile, veh);


end



% %% plot to illustrate downsampling
% figure(9),
% 
% subplot 231, hold off, 
%   plot(world.roadE, world.roadN,'r.'), hold on,plot(refWorld.roadE, refWorld.roadN,'b-'), title('path')
% subplot 232, hold off, 
%   plot(world.s, world.widthLeft,'r.'),hold on,plot(refWorld.s, refWorld.widthLeft,'b-'), title('width right and left')
%   plot(world.s, world.widthRight,'r.'), hold on, plot(refWorld.s, refWorld.widthRight,'b-')
% subplot 233,  hold off,
%   plot(world.s, world.K,'r.'),hold on,plot(refWorld.s, refWorld.K,'b-'), title('Curvature')
% subplot 234,  hold off,
%   plot(world.s(1:end-1), diff(world.s),'r.'),hold on,plot(refWorld.s(1:end-1), diff(refWorld.s),'b-'), title('ds')
% subplot 235,  hold off,
%   plot(world.s, world.roadPsi,'r.'),hold on,plot(refWorld.s, refWorld.roadPsi,'b-'), title('roadPsi') 
% subplot 236,  hold off,
%   plot(velocityProfile.s, velocityProfile.Ux,'r.'),hold on,plot(vpRef.s, vpRef.Ux,'b-'), title('Velocity') 
%   xlim([min(velocityProfile.s) max(velocityProfile.s)])