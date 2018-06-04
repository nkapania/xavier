function [P] = loadProcessedData()

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

end