function [P, L] = loadProcessedData()

    addpath('C:\Users\ddl\Documents\localTestData\searchData')
    
    %read in all the datasets
    P = {};
    i = 0;

    while true
        i = i+1;
        try
            P{i} = load(['p' num2str(i)]);
        catch
            break
        end
    end

    %find best possible lap time
    [sGreedy, UxGreedy, UxDes, muOpt, segNum, I] = theoreticalMax(P);
    
    %form lookup table of greedy solution for A*
    L = cumtrapz(sGreedy, 1./UxGreedy);

    %eliminate datasets that are not useful.
    toRemove = [];
    for i = 1:len(P)
        if isempty(find(I == i))
            toRemove = [toRemove; i];
        end
    end
        
    disp([num2str(len(toRemove)) ' Datasets Eliminated' ]);
    P(toRemove) = [];
    
    f2 = figure; 
    h(1) = subplot(2,1,1);
    plot(sGreedy, muOpt)
    h(2) = subplot(2,1,2);
    plot(sGreedy, segNum)
    linkaxes(h,'x')

end