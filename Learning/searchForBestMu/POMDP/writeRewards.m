function writeRewards(fileID, pd)
    for state = 0:pd.NUM_STATES-1
        [u, s, m] = indexToTuple(state, pd);
        for i = 0:pd.NUM_ACTIONS-1
            
            if s < pd.s(end)
            
                action = pd.actions(i+1);
                endState0 = tupleToIndex(0, s+pd.ds, action, pd);
                r0 = getReward(state, action, endState0, pd);
                fprintf(fileID,'%s %d %s %d %s %d %s %f \n','R: ', i, ' : ', state, ' : ', endState0, ' :* ', r0);
            
            
                endState1 = tupleToIndex(1, s+pd.ds, action, pd);
                r1 = getReward(state, action, endState1, pd);
                fprintf(fileID,'%s %d %s %d %s %d %s %f \n','R: ', i, ' : ', state, ' : ', endState1, ' :* ', r1);
            
            else
                fprintf(fileID,'%s %d %s %d %s %d %s %f \n','R: ', i, ' : ', state, ' : ', state, ' :* ', 0);
            end 
                
        end
    end

end