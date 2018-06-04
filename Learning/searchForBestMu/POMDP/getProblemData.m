function pd = getProblemData(ds, s1)
    
    disp('Obtaining Problem Data')

    %mu values that the car can drive at
    actions = [.9; .92; .93; .94; .95; .97];
    
    %discretized observation ranges for lateral tire slip (degrees)
    observations = [5, 6, 7, 7.5, 8, 8.5, 9];
    
    
    %load experimentally observed data sets
    processRawData(ds)
    P = loadProcessedData();
    
    %compute state transition probability matrices for each mu value
    pd.T = computeTmatrices(P, actions);
    
    %compute observation probability matrices for each state
    pd.O = computeOmatrices(P, observations);
        
    %possible values of distance along the track
    s = (ds:ds:s1);
	pd.ds = ds;
    
    %compute velocities for each state
    pd.UxTable = computeUxTable(P, actions, s);
    
    %discount factor for POMDP - should not matter if implemented correctly
    pd.discount = 0.999999990000000;
    
    
    %binary state for sliding 0 is not sliding, 1, is sliding
    pd.actions = actions;
    pd.s = s;
    pd.P = P;
    
    pd.S = len(s);
    pd.observations = observations;
    pd.NUM_ACTIONS = len(actions);
    pd.NUM_STATES =  pd.NUM_ACTIONS*pd.S*2;
    pd.NUM_OBSERVATIONS = len(observations)+1;

end
