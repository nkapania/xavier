function writeObservationProbabilities(fileID, pd)
    for state = 0:pd.NUM_STATES-1
        p = getObservationProbability(state, pd); %currently modeled as not depending on action
        for i = 0:pd.NUM_OBSERVATIONS-1
            fprintf(fileID,'%s %d %s %d %s %f \n','O: * : ', state, ' : ', i, ' ', p(i+1));
        end
    end
end
