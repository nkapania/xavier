%todo - make this not suck and go through all fields.
function [worldNew] = downsampleWorld(world, factor)
    N = numel(world.s);
    n = round(N/factor);
    
    ind = round(linspace(1, N, n));
    
    worldNew.s = world.s(ind);
    worldNew.roadPsi = world.roadPsi(ind);
    worldNew.roadE = world.roadE(ind);
    worldNew.roadN = world.roadN(ind);
    worldNew.K = world.K(ind);
    worldNew.isOpen = world.isOpen;
    
    try
        worldNew.widthLeft = world.widthLeft(ind);
        worldNew.widthRight = world.widthRight(ind);
        worldNew.lam2 = world.lam2;
    catch
    end
end