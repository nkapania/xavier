function [worldNew] = downsampleWorldFixedn(world, elements)
%% Downsamples the world to a fixed amount of sample points
%  Adapted from N. Kapanias version that sampled a fixed distance
%  Sam

    N = numel(world.s);
    n = elements;  
    
    ind = round(linspace(1, N, n));
    
    worldNew.s = world.s(ind);
    worldNew.roadPsi = world.roadPsi(ind);
    worldNew.roadE = world.roadE(ind);
    worldNew.roadN = world.roadN(ind);
    worldNew.K = world.K(ind);
    worldNew.isOpen = world.isOpen;
    
    %copyCurE = exist('world.curE','var');
    
   %if(1 == copyCurE)
   %     worldNew.curE = world.curE;
   %end
    
    try
        worldNew.widthLeft = world.widthLeft(ind);
        worldNew.widthRight = world.widthRight(ind);
    catch
    end
end