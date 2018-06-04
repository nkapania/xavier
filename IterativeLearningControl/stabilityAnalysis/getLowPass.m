function filter = getLowPass(wc, ts)
A = -wc;
B = 1;
C = wc;
D = 0;

filter = ss(A,B, C, D);
filter = c2d(filter, ts);
end
