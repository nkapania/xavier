function T = computeTmatrices(P, actions)
%     %initialize all matrices
%     for i = 1:len(actions)
%         T{i} = zeros(2);
%     end 
%     
%     %iterate through all datasets
%     for i = 1:len(P)
%         p = P{i};
%         for j = 1:len(p.s)-1
%             ind = find(actions == p.currMu(j));
%             
%             if isempty(ind)
%                 continue   %not a mu value we are interested in - continue
%             else
%                 slidingNow  = boolean(p.FxFB(j))+1; %plus 1 for array indexing. Default notation: 0 is not sliding, 1 is sliding  
%                 slidingNext = boolean(p.FxFB(j+1))+1;          %HACK where I use slip circle feedback as determinant of whether car is sliding
%             
%                 T{ind}(slidingNow,slidingNext) = T{ind}(slidingNow,slidingNext)+1; %increment
%             end
%             
%         end
%         
%     end
%     
%     %normalize T
%     for i = 1:len(T)
%         T{i} = T{i}./repmat(sum(T{i},2), 1, 2);
%     end

T{1,1} = [1     0; 1 0];
T{2,1} = [.99 .01; 0 1];
T{3,1} = [.97 .03; 0 1];
T{4,1} = [.95 .05; 0 1];
T{5,1} = [.92 .08; 0 1];
T{6,1} = [.85 .15; 0 1];

T{1,2} = [1 0; 1 0];
T{2,2} = [1 0; .95 .05];
T{3,2} = [1 0; .85 .15];
T{4,2} = [1 0; .75 .25];
T{5,2} = [1 0; .5 .5];
T{6,2} = [.85 .15; 0 1];
    
end
    