function plotENfromS(s, sDes, posE, posN,c)
    ind = find(s > sDes-5 & s < sDes + 5);
    hold on;
    plot(posE(ind), posN(ind),[c 'o'],'MarkerFaceColor',c)
end
