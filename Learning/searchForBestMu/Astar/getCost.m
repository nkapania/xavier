function cost = getCost(P, currentState, neighborState)
   indS = currentState(1); profS = currentState(2);
   indE = neighborState(1); profE = neighborState(2);
   
   sS = P{profS}.s(indS);
   sE = P{profE}.s(indE);
   UxS = P{profS}.Ux(indS);
   UxE = P{profE}.Ux(indE);
   
   ax = (UxE - UxS)/(sE - sS);
   cost = log(ax*(sE - sS) + UxS)/ax - log(UxS)/ax;
   
   if profS ~= profE
       cost = cost + .05;
       if P{profS}.FxFB(indS) ~= 0 || P{profE}.FxFB(indE) ~= 0
           cost = cost + 1;
       end
   end
   
end