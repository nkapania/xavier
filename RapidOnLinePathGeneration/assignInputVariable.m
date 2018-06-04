function [params] = assignInputVariable(params,var)


N = length(var);

varName = inputname(2);

%create output vector
for iN=1:(N)
name = [varName '_' int2str(iN)];
value = var(iN);
if(iscell(value))
    params.(name) = value{1};
else
    params.(name) = value;    
end
end

end