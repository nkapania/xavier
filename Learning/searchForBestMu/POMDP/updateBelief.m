function bp = updateBelief(b, o, a, T, O)
      %T = T{a};

      %bp(1) = O(1, o) *  (b(1)*T(1,1)  +   b(2)*T(2,1)     );
      %bp(2) = O(2, o) *  (b(1)*T(1,2)  +   b(2)*T(2,2)     );
      
      %bp = bp/sum(bp);
      
      if o >= 5
          bp = [0 1];
      else
          bp = [1 0];
      end
      
end