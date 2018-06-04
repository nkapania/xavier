%get velocity profile using 3 pass method. Uses fzero so kind of slow right
%now. Can definitely speed up.

function velocityProfile = getConstantVP(world, Ux)

    s = world.s;
    N = numel(s);
    
    velocityProfile.s = s;
    velocityProfile.Ux = Ux*ones(N,1);
    velocityProfile.Ax = zeros(N,1);
end