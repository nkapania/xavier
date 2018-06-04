function [s, UxOpt, UxDesOpt, muOpt, segNumOpt, I] =  theoreticalMax(P)
    s = P{1}.s;
    N = len(P);
    Ux = zeros(len(s), N);
    FxFB = zeros(len(s), N);
    UxDes = zeros(len(s), N);
    mu    = zeros(len(s), N);
    segNum = zeros(len(s), N);
    
    for i = 1:N
        Ux(:,i) = P{i}.Ux;
        FxFB(:,i) = P{i}.FxFB;
        UxDes(:,i) = P{i}.UxDesired;
        mu   (:,i) = P{i}.currMu;
        segNum(:,i) = P{i}.segNum;
    end
    
    FxFB(FxFB ~= 0) = 1; FxFB(FxFB == 0) = NaN;
    UxSlip = Ux.*FxFB;
            
    [UxOpt, I] = max(Ux');
    UxDesOpt = zeros(len(s), 1);
    muOpt    = zeros(len(s), 1);
    segNumOpt = zeros(len(s), 1);
    for i = 1:len(s)
        segNumOpt(i) = segNum(i,I(i));
        UxDesOpt(i) = UxDes(i,I(i));
        muOpt   (i) = mu   (i,I(i));
    end
    
    close all; 
    f1 = figure;
    plot(s, Ux); 
    hold on;
    plot(s, UxSlip,'*')
    plot(s, UxOpt,'k','LineWidth',2)
    plot(s, UxDesOpt,'r','LineWidth',2)
    
    disp(['Best Possible Lap Time: ' num2str(trapz(s, 1./UxOpt)) ' sec'])
    
end
        