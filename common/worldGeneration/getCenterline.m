%This function gets the centerline from a road edge file. The function
%input is a string containing the path to a road edge .mat file. Currently our
%road edge files only have East and North (not Up) info, so the centerline
%is 2D. 

%Nitin Kapania

function [centerline roadWidth s] = getCenterline(in, out, numPoints)

N = numel(in(:,1));
M = numel(out(:,1));

ind1 = floor(linspace(1, N, numPoints)); 
ind2 = floor(linspace(1, M, numPoints));


in = [in(ind1,1) in(ind1,2)]; out = [out(ind2,1) out(ind2,2)];

N = numel(in(:,1));
M = numel(out(:,2));


%pairs is an array where each element is a pair of XY points - one from the
%outer road edge, one from the inner, that are closest to each other.
pairs = [];


for i = 1:N
    pairs(i).in = [in(i,1) in(i,2)];
    pairs(i).out = findClosest(pairs(i).in, out);
end

%once we have the pairs array, just take the spatial midpoint to find the
%centerline coordinates
centerline = zeros(N,2);
roadWidth  = zeros(N,1);
s          = zeros(N,1);

for i = 1:N
    centerline(i,:) = (pairs(i).in + pairs(i).out)/2;
    roadWidth(i) = norm(pairs(i).in - pairs(i).out, 2);  
end

for i = 2:N
    s(i) = s(i-1) + norm( centerline(i,:) - centerline(i-1,:) );
end
    
% %plot stuff
% figure; hold on;
% for i = 1:N
%     plot([pairs(i).in(1) pairs(i).out(1)], [pairs(i).in(2) pairs(i).out(2)]);
%     plot(centerline(:,1), centerline(:,2),'r');
% end
% 
% grid on; axis equal;

end

function closest =  findClosest(point, array)
    N = numel(array(:,1));
    shortest = Inf;
    closest = [];
    
    for i = 1:N
        testPoint = array(i,:);
        dist = norm(point - testPoint);
        if dist < shortest
            shortest = dist;
            closest = testPoint;
        end
    end
end
        
    
    