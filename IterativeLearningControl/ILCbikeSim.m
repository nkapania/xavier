function [SIM, ILC] = ILCbikeSim(world, veh, sampleTime, vp, M, method)

     ilc.s = vp.s; ilc.d = zeros(size(vp.s)); ilc.f = zeros(size(vp.s));
        
     
    for i = 1:M
        ILC(i) = ilc;
        sim = bikeSim(world, veh, sampleTime, vp, ilc);
        pause(1);
        SIM(i) = sim;
        ilc = getILC(sim, veh, sampleTime, method); %ilc input for next iteration
    end

end