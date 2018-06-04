%Script to estimate best lap times
close all; clear all; clc;
load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9FG_2015-09-30_aa.mat')


s = mapMatch.s_m; 
lapTime = zeros(size(s));

sDS = []; LT = [];
for i = 1:100:len(s)
    sDS = [sDS; s(i)];
    
    lapTime = getLapTime(s(i), i, s, t);
    LT = [LT; lapTime];
end

plot(sDS, LT,'b*');
ylim([137 140]);
hold on;

load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\fullautomu9quill_2015-09-30_aa.mat')

s = mapMatch.s_m; 
lapTime = zeros(size(s));

sDS = []; LT = [];
for i = 1:100:len(s)
    sDS = [sDS; s(i)];
    
    lapTime = getLapTime(s(i), i, s, t);
    LT = [LT; lapTime];
end

plot(sDS, LT,'r*');
legend('Fast Gen','Quill')