function plotMuLines(s, mu, maxVal)

    for i = 2:len(mu);
        if mu(i) ~= mu(i-1)
            plot([s(i) s(i)], [0, maxVal], 'r','LineWidth',2)
        end
    end
    
end