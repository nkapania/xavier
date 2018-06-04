function [newS] = trimStruct(S,desiredIndices)
% Extracts the desired indices from a struct
% shorter elements in the struct will be copied unaffected
%
% Uses inefficient but easy to use cell methods, copying the desired names
% Author: Sam Schacher

SNames = fieldnames(S);

N = length(desiredIndices);

for loopIndex = 1:numel(SNames) 

    
    temp = S.(SNames{loopIndex});
    if length(temp) > N
        % This variable is dependent on s and needs to be trimed
        temp = temp(desiredIndices);
    end
    % add field to new structure
    newS.(SNames{loopIndex}) = temp;
    
end



end