clear all; close all; clc;

ds = 5; %spacing between points)

processRawData(ds);
[P, L] = loadProcessedData; %in addition to loading data, also compute greedy algorithm solution

%find fast path using A* search
tic
[I, numOps] = astar(P, L, ds, 4540, ds); %I is array of optimal velocity profile to follow
toc

[s, mu, Ux, UxDes] = unpackOptResults(P,I);

figure(1)
hold on;
plot(s, Ux, 'm', 'LineWidth',2);
plot(s, UxDes, 'g','LineWidth',2);
plotMuLines(s, mu, max(UxDes));

figure(2)
subplot(2,1,1);
hold on; plot(s, mu, 'r')

subplot(2, 1, 2);
hold on;
plotMuLines(s, mu, 70)