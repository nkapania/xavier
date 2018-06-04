%% Nitin Kapania
% code to take policy file from SARSOP algorithm (this is a java xml object)
% and convert into a MATLAB cell object. Requires the xml2struct script available from Mathworks.com

% These xml objects are rather large so increasing Java heap memory may be
% necessary.

close all; clear all; clc;

p1 = xml2struct('out.xml');

%%
alpha = p1.Policy.AlphaVector;
clear p1;

%%
N = str2num(alpha.Attributes.numVectors);
n = str2num(alpha.Attributes.vectorLength);

%%
pi = {}; %store optimal policy in MATLAB cell

for i = 1:N
    pi{i}.action = str2num(alpha.Vector{i}.Attributes.action);
    pi{i}.alpha  = str2num(alpha.Vector{i}.Text);
end

