function writeStartState(state, fileID, pd)
    fprintf(fileID,'%s \n', ['#Start State: ' num2str(state) ] );
    
    %generate super long string of initial probabilities because
    %sarsop is being dumb
    
    str = [];
    for i = 0:pd.NUM_STATES-1
        prob = (i==state);
        str = [str num2str(prob) ' '];
    end
    
    fprintf(fileID,'%s \n',['start: ' str]);
    fprintf(fileID,'\n');
    
end