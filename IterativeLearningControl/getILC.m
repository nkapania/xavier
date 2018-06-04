function ilc = getILC(sim, veh, ts, method)
    if strcmp(method,'PD') %PD type ILC
        ilc.s = sim.s;
        [ilc.d, ilc.f] = PD_ILC(sim.e, sim.v, sim.deltaILC, sim.FxILC, ts);  
    elseif strcmp(method,'Q_SISO')
        N = round(sim.s(end));
        [ilc.s, ilc.d, ilc.f] = Q_ILC_SISO(veh, sim, ts, N);
    elseif strcmp(method,'Q_MIMO')
        N = round(sim.s(end));
        [ilc.s, ilc.d, ilc.f] = Q_ILC_MIMO(veh, sim, ts, N);
    elseif strcmp(method, 'CVX')
        error('Not Implemented Yet');
        N = round(sim.s(end));
        [ilc.s, ilc.d, ilc.f] = CVX_ILC(veh, sim.e, sim.Ux, sim.curvature, sim.s, N, sim.deltaILC, ts);
    else
        error('Unknown ILC type')
    end
end
