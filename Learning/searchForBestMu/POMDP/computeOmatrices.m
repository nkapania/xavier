function O = computeOmatrices(P, observations)
%     %initialize O matrix
%     O = zeros(2, len(observations)+1); %1 row for not sliding, 1 row for sliding
%     
%     %iterate through all datasets
%     for i = 1:len(P)
%         p = P{i};
%         for j = 1:len(p.s)
%             sliding = boolean(p.FxFB(j))+1; %plus 1 for array indexing. Default notation: 0 is not sliding, 1 is sliding
%             ind     = binObservation(abs(p.alphaF(j)*180/pi), observations);
%             
%             O(sliding, ind) = O(sliding, ind)+1;
%             
%         end
%         
%     end
%     
%     %normalize O
%     O = O./repmat(sum(O,2), 1, len(O(1,:)));

O = [.2 .2 .2 .2 .2 0 0 0; 0 0 0 0 0 .33 .33 .34];
    
end
    
    
    