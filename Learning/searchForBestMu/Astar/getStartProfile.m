function I = getStartProfile(P)

    Ux0 = zeros(len(P),1);
    for i = 1:len(P)
        Ux0(i) = P{i}.Ux(1);
    end

    [~,I] = max(Ux0);
end
