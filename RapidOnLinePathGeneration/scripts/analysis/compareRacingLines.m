%each line is a set of N x 2 (East, North) points
%Runs in n^2 time because I'm lazy

function distance =  compareRacingLines(line1, line2)
    n = numel(line1(:,1));
    distance = zeros(n, 1);
    for i = 1:n
        point = [line1(i, 1) line1(i, 2)];
        distance(i) = getMinDistance(point, line2);
    end
    
end
        
    
    