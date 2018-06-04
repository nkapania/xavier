% Code to print out .pomdp file for SARSOP algorithm. 

clear all; close all; clc;
fileID = fopen('findoptimalmu.pomdp','w');
ds = 10;
pd = getProblemData(ds, 4540); %specify range of s values along track

fprintf(fileID,'%s \n', '#Code for POMDP to find the best mu values to drive around the track');
fprintf(fileID,'\n');
fprintf(fileID,'\n');

fprintf(fileID,'%s \n', '#Number of states, actions, and observations');
fprintf(fileID,'%s \n', ['discount: ' num2str(pd.discount,9)]);
fprintf(fileID,'%s \n', 'values: reward');
fprintf(fileID,'%s %d \n', 'states: ', pd.NUM_STATES);
fprintf(fileID,'%s %d \n', 'actions: ', pd.NUM_ACTIONS);
fprintf(fileID,'%s %d \n', 'observations: ', pd.NUM_OBSERVATIONS);
fprintf(fileID,'\n');

%write start state - this is awkward but I think the only way to get it to 
%work with sarsop;
writeStartState(0, fileID, pd)

%write out transition probabilities
disp('Writing Transition Probabilities')
fprintf(fileID,'%s \n', '#Transition Probabilities');
writeTransitionProbabilities(fileID, pd)

%write out observation probabilities
disp('Writing Observation Probabilities')
fprintf(fileID,'\n');
fprintf(fileID,'%s \n', '#Observation Probabilities');
writeObservationProbabilities(fileID, pd)

%write out rewards
disp('Writing Rewards')
fprintf(fileID,'\n');
fprintf(fileID,'%s \n', '#Observation Probabilities');
writeRewards(fileID, pd)
    
    
fclose(fileID);
