function writeTransitionProbabilities(fileID, pd)
    for state = 0:pd.NUM_STATES-1
        [u, s, m] = indexToTuple(state, pd);
        for i = 0:pd.NUM_ACTIONS-1
            
            if s < pd.s(end) %not in an end state, continue
            
                action = pd.actions(i+1);
                endState0 = tupleToIndex(0, s+pd.ds, action, pd);
                p0 = getTransitionProbability(endState0, action, state, pd);
                fprintf(fileID,'%s %d %s %d %s %d %s %f \n','T: ', i, ' : ', state, ' : ', endState0, ' ', p0);
            
                endState1 = tupleToIndex(1, s+pd.ds, action, pd);
                p1 = getTransitionProbability(endState1, action, state, pd);
                fprintf(fileID,'%s %d %s %d %s %d %s %f \n','T: ', i, ' : ', state, ' : ', endState1, ' ', p1);
            
                if (p0 + p1) ~= 1
                    error('check this')
                end
                
            else  %at the end, go back to start???? 
                fprintf(fileID,'%s %d %s %d %s %f \n','T: * : ', state, ' : ', state, ' ', 1);
            end 
                
        end
    end
    
    
end
        
        