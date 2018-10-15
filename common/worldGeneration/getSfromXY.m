function s = getSfromXY(x, y)

N = len(x); 
s = zeros(N,1);

for i = 2:N
    s(i) = s(i-1) + norm([x(i) - x(i-1); y(i) - y(i-1)]);
end

end

