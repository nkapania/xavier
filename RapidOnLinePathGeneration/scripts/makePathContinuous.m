%modify the centerline map so that it is continuous. If you're reading
%this, I want you to know that it is some of the worst code I have written
%in my life, going back to my days as an undergraduate. I merely ask that
%you not judge me based on the code you are about to see;

%Nitin

clear all; close all; clc;
addpath(genpath('C:\Users\ddl\Desktop\nkapania\simulation\common'));
addpath(genpath('.\scripts'));

path = genWorldFromCSV('THcenter.csv'); 
%load('C:\Mapping\Maps\Thunderhill\fastGenMap.mat'); path = mapWorld;
bounds = load('thunderhill_bounds_shifted.mat');

%% remove points at beginning and end of map;
sI = 200;
eI = len(path.s) - 1600;  %hand tuned on the straight so the beginning and end 
                         %points can be roughly connected by a straight

% generate new map, with linearly spaced points
newPath.s = linspace(0, path.s(eI)- path.s(sI), len(path.s(sI:eI)))';
newPath.roadE = interp1(path.s(sI:eI), path.roadE(sI:eI), newPath.s+path.s(sI));
newPath.roadN = interp1(path.s(sI:eI), path.roadN(sI:eI), newPath.s+path.s(sI));
newPath.roadPsi = interp1(path.s(sI:eI), path.roadPsi(sI:eI), newPath.s+path.s(sI));
newPath.K       = interp1(path.s(sI:eI), path.K(sI:eI), newPath.s+path.s(sI));



%% connect the beginning and end by adding a cubic spline
XX = 20;

posE = [newPath.roadE(end-XX:end); newPath.roadE(1:XX)];
posN = [newPath.roadN(end-XX:end); newPath.roadN(1:XX)];
sP = zeros(size(posE));
for i = 2:len(sP);
    sP(i) = sP(i-1) + norm([posE(i) - posE(i-1); posN(i) - posN(i-1)]);
end

ppE = spline(sP, posE);
ppN = spline(sP, posN);

%first derivatives and second derivatives of splines
ppEd = ppE; ppEd.coefs = ppE.coefs*diag([3 2 1],1);
ppNd = ppN; ppNd.coefs = ppN.coefs*diag([3 2 1],1); 
ppEdd = ppEd; ppEdd.coefs = ppEd.coefs*diag([3 2 1],1);
ppNdd = ppNd; ppNdd.coefs = ppNd.coefs*diag([3 2 1],1); 

s = linspace(sP(XX+1), sP(XX+2)-.25, round(sP(end)*4))';
x  = ppval(ppE , s);  x1 = ppval(ppEd, s); x2 = ppval(ppEdd, s);
y  = ppval(ppN , s);  y1 = ppval(ppNd, s); y2 = ppval(ppNdd, s);
%K = (x1.*y2 - y1.*x2)./sqrt((x1.^2 + y1.^2).^3);
K = zeros(size(s));
psi = getPsiFromEN(x, y) - 2*pi;


 newPath.s = [s - s(1); s(end) - s(1) + .25 + newPath.s];
 newPath.roadE = [x; newPath.roadE];
 newPath.roadN = [y; newPath.roadN];
 newPath.K     = [K   ; newPath.K];
 newPath.roadPsi = [psi; newPath.roadPsi];
 newPath.road_IC = [newPath.roadPsi(1); newPath.roadE(1); newPath.roadN(1)];
% newPath.name = path.name;
% newPath.xyz_ref = path.xyz_ref;
% newPath.isOpen = path.isOpen;

%newPath = shiftWorld(newPath, 360);

%% visualize results
close all;
plot(path.roadE, path.roadN);
grid on; hold on; axis equal;
plot(newPath.roadE, newPath.roadN,'r');
plot(newPath.roadE(1), newPath.roadN(1),'r*');
plot(newPath.roadE(end), newPath.roadN(end),'r*');
plot(x, y, 'g');
plot(bounds.in(:,1), bounds.in(:,2),'k');
plot(bounds.out(:,1), bounds.out(:,2),'k');

trueS = zeros(size(newPath.s));
for i = 2:len(trueS)
    trueS(i) = newPath.s(i-1) + norm([newPath.roadE(i) - newPath.roadE(i-1); newPath.roadN(i) - newPath.roadN(i-1)]);
end

figure; 
plot(diff(newPath.s)); hold on;
plot(diff(trueS),'r');

figure;
plot(newPath.s, newPath.K);

figure;
plot(newPath.s, newPath.roadPsi);

figure;
plot(diff(newPath.roadPsi));


