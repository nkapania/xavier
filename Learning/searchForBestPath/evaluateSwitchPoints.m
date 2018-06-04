function [newPath, vpNew, ltNew] = evaluateSwitchPoints(veh, p1, p2, p2idx1, p2idx2, lt)
   
    
    if p2idx2 < p2idx1 % we are wrapping around
        ind2 = [p2idx1:len(p2.mu) 1:p2idx2];
    else
        ind2 = p2idx1:p2idx2;
    end    
    
    %arrays from the path to be spliced in
    N = p2.roadN(ind2);
    E = p2.roadE(ind2);
    K = p2.K(ind2);
    G = p2.grade(ind2,:);
    B = p2.bank(ind2,:);
    M = p2.mu(ind2);
    P = p2.roadPsi(ind2);

    %find start and end points of host path
    [~, p1idx1] = min(sqrt( (p1.roadN - N(1)).^2 + (p1.roadE - E(1)).^2));
    [~, p1idx2] = min(sqrt( (p1.roadN - N(end)).^2 + (p1.roadE - E(end)).^2));
    
    disp(['Evaluating Switch Point from s = ' num2str(p1.s(p1idx1)) ' to s = ' num2str(p1.s(p1idx2))]);

    
    if p1idx2 < p1idx1 %we are wrapping around
        range1 = p1idx2:p1idx1;
        range2 = [];
        
        %some hacky math to reconstruct a new S array
        s1 =           cumsum([0; max(diff(p1.s(range1)), .05)]);
        S =  s1(end) + cumsum(max([.25; diff(p2.s(ind2))],   .05));
        s2 = [];
        s =     [s1; S; s2];
        
    else
        range1 = 1:p1idx1;
        range2 = p1idx2:len(p1.mu);
        
        %some hacky math to reconstruct a new S array
        s1 =           cumsum([0; max(diff(p1.s(range1)), .05)]);
        S =  s1(end) + cumsum(max([.25; diff(p2.s(ind2))],   .05));
        s2 = S(end)  + cumsum(max([.25; diff(p1.s(range2))], .05));
        s =     [s1; S; s2];
    end
    
    %Crude path splice for lap time improvement purposes
    k =     [p1.K(range1)      ;  K; p1.K(range2)];
    grade = [p1.grade(range1,:);  G; p1.grade(range2,:)];
    bank =  [p1.bank(range1,:) ;  B;  p1.bank(range2,:)];
    mu   =  [p1.mu(range1);       M;  p1.mu(range2)];
    psi  =  [p1.roadPsi(range1);  P; p1.roadPsi(range2)];

    %Make the new path
    newPath.s = s;
    newPath.K = k;
    newPath.bank = bank;
    newPath.grade = grade;
    newPath.mu = mu;
    newPath.roadPsi = psi; 
    newPath.isOpen = 0;
    
    %visualize splice results
    figure; 
    plot(p1.roadE(1:p1idx1), p1.roadN(1:p1idx1));
    hold on; grid on; axis equal;
    plot(p1.roadE(p1idx2:end), p1.roadN(p1idx2:end));    
    hold on; plot(E, N,'r*')

    figure;
    plot(p1.s, p1.K);
    hold on;
    plot(newPath.s, newPath.K,'k');
    
    % check if new path is faster - if it is, keep it. 
    vpNew = getVelocityProfileBG(newPath, veh, 1);
    ltNew = trapz(vpNew.s, 1./vpNew.Ux); 
     
    ltDiff = ltNew - lt;
    if ltDiff < 0
         disp(['Splice improved lap time by ' num2str( abs(ltDiff) ) ' seconds. New path generated.'])
    else
        disp(['Splice worsened lap time by '  num2str( abs(ltDiff) ) ' seconds. Keeping old path.'])
        newPath = p1; %keep old path
        ltNew = lt;
    end
    
    
end

   
    
    