function [worldNew] = downsampleWorldSegment(world, factor,startIndex,endIndex)
    N = numel(world.s(startIndex:endIndex));
    n = round(N/factor);
    
    ind = round(linspace(startIndex, endIndex, n));
    
    worldNew.s = world.s(ind);
    worldNew.roadPsi = world.roadPsi(ind);
    worldNew.roadE = world.roadE(ind);
    worldNew.roadN = world.roadN(ind);
    worldNew.K = world.K(ind);
    worldNew.isOpen = world.isOpen;
    
    try
        worldNew.widthLeft = world.widthLeft(ind);
        worldNew.widthRight = world.widthRight(ind);
    catch
    end
end