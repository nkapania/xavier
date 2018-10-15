clear all; close all; clc;
addpath(genpath('common'))

%% Load data and check for overlap
load('cpg_winding_track_raw.mat')

%plot(in(:,1), in(:,2),'k'); hold on; grid on; axis equal;
%plot(out(:,1), out(:,2),'k');

%% calculate s for both in and out

nIn = len(in(:,1));

xIn = in(:,1);
yIn = in(:,2);
sIn = zeros(nIn,1);

nOut = len(out(:,1));
xOut = out(:,1);
yOut = out(:,2);
sOut = zeros(nOut,1);

%% Calculate S

for i = 2:nIn
    sIn(i) = sIn(i-1) + norm([xIn(i) - xIn(i-1); yIn(i) - yIn(i-1)]);
end

for i = 2:nOut
    sOut(i) = sOut(i-1) + norm([xOut(i) - xOut(i-1); yOut(i) - yOut(i-1)]);
end

%%
% Plot data, check for when data repeats
figure; 
plot(sIn, xIn,'k'); hold on; plot(sIn, yIn,'r'); title('inner')
sClip = 3770; %value to clip - obtained from plots by trial and error!
ind = find(sIn < sClip);
sIn = sIn(ind); xIn = xIn(ind); yIn = yIn(ind);
plot(sIn, xIn,'g--'); plot(sIn, yIn,'c--')

%% Do the same for outer boundaries
figure; 
plot(sOut, xOut,'k'); hold on; plot(sOut, yOut,'r'); title('outer')
sClip = 3800; %value to clip - obtained from plots by trial and error!
ind = find(sOut < sClip);
sOut = sOut(ind); xOut = xOut(ind); yOut = yOut(ind);
plot(sOut, xOut,'g--'); plot(sOut, yOut,'c--')


%% save data
in = [xIn yIn];
out = [xOut yOut];

save '/home/nkapania/xavier/common/roadEdges/cpg_winding_track.mat' in out
