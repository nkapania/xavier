clear all; close all; clc;
load('C:\Users\ddl\Documents\localTestData\2015 6 24 FastMapGen\mu90baselineStitch.mat');
%%
ind1 = 1:134; ind2 = 729:len(t);

v1 = OxTSData.vxCG(ind1); v2 = OxTSData.vxCG(ind2);
s1 = mapMatch.s(ind1);
s2 = mapMatch.s(ind2);

plot(s1, v1); hold on; plot(s2, v2);
load baseFill
plot(s3, v3,'r')

s = [s1 s3 s2];
v = [v1 v3 v2];

figure
plot(s, v,'k');
lt = trapz(s, 1./v);

%Lap Time = 140.49

