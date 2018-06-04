function I = reconstructPath(cameFrom, currentState)
    I = currentState;
    while cameFrom.isKey(num2str(currentState))
        currentState = cameFrom(num2str(currentState));
        I = [I; currentState];
    end
    
    I = flipud(I);
end