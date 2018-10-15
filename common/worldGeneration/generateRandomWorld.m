function [world] = generateRandomWorld(N)
%GENERATERANDOMWORLD creates an arbitrary world consisting of N turns.
%Useful for generating real world data. 

ds = 0.5;


[s, K] = generateRandomClothoid(ds, 0, .02, 50, 200);

for i = 2:N
    [si, Ki] = generateRandomClothoid(ds, 0, .02, 50, 200);
    si = si + s(end) + ds;
    
    s = [s; si];
    K = [K; Ki];
    
end

world = genWorldFromSK(s, K);

end