%This code currently adds bank and grade information to a path object by
%taking in a legacy xls file and the associated path for that file. We then
%get bank and grade estimates by interpolating over the legacy xls file,
%which also accounts for the difference in map start points

%TODO: A more elegant solution is to add bank and grade information from a
%"master" database that is linked to east and north points. This is a
%summer project tho.

clear all; close all; clc;
addpath(genpath('common'))
addpath('C:\Mapping\Maps\Thunderhill')

refWorld = genWorldFromCSV('thunderhill_race.csv'); %% reference world and
topoFile = 'thunderhill_raceBG.csv';                %% bank and grade

topoData = importdata(topoFile,',',1);
s = topoData.data(:,1);
grade = topoData.data(:,2);
gradeS = topoData.data(:,3);
gradeSS = topoData.data(:,4);
bank = topoData.data(:,5);
bankS = topoData.data(:,6);
bankSS = topoData.data(:,7);

%%

load('C:\Mapping\Maps\Thunderhill\fastGenMapSafe.mat') %mapWorld to add bank and grade info to

N = len(mapWorld.s);
mapWorld.grade = zeros(N,3); %second and third columns are the first and second
mapWorld.bank  = zeros(N,3); %spatial derivatives
sREF = zeros(N,1);

clear mapMatch;
for i = 1:N
    if ~mod(i,1000)
        i/N
    end
    posE = mapWorld.roadE(i); posN = mapWorld.roadN(i);
    [~, ~, ~, sREF(i)] = mapMatch(posE, posN, 0, refWorld);
    if sREF(i) > s(end);
        sREF(i) = s(end);
    elseif sREF(i) < 0;
        sREF(i) = 0;
    end
end
    
mapWorld.grade = interp1(s, [grade gradeS gradeSS], sREF);
mapWorld.bank  = interp1(s, [bank  bankS  bankSS],  sREF); 


%%
close all;
plot(mapWorld.s, mapWorld.grade(:,1));
hold on; plot(mapWorld.s, mapWorld.K*5,'r')
