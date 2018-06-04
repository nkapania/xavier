function out = NLsim(sys, Ux, K, type)
     dt = .005;
     N = round(5/dt);
     
     a = sys.a; b = sys.b; L = sys.a+sys.b;
     m = sys.m; Cf = sys.Cf; Cr = sys.Cr; Iz = sys.Iz; xLA = sys.xLA;
     kLK = sys.LK; muP = sys.muP; muS = sys.muS;
     FzF = sys.FzF; FzR = sys.FzR; alphaFrontTable = sys.afTable;
     alphaRearTable =  sys.arTable; FyFtable = sys.FyFtable;
     FyRtable = sys.FyRtable;
     
     e = 0;
     dPsi =0;
     r = 0;
     beta = 0;
     Uy = beta*Ux;
    
     for i = 1:N
         FyFdes = b/L*m*Ux^2*K;
         FyRdes = a/b*FyFdes;
         alphaFdes = interp1(FyFtable, alphaFrontTable, FyFdes,'linear',-max(alphaFrontTable)*sign(FyFdes));
         alphaRdes = interp1(FyRtable, alphaRearTable , FyRdes,'linear',-max(alphaRearTable)*sign(FyRdes));
         deltaFFW = K*L +alphaRdes - alphaFdes;
         betaFFW =  alphaRdes + b*K;
         
         if strcmp(type,'lk') 
            deltaFB = -kLK*e - kLK*xLA*sin(dPsi); 
         elseif strcmp(type,'beta')
            deltaFB = -kLK*e - kLK*xLA*sin(dPsi+betaFFW); 
         end
            
         delta = deltaFB+deltaFFW;
         alphaF = atan((Uy + a*r)/Ux) - delta;
         alphaR = atan((Uy - b*r)/Ux);
         FyF = tireforces(Cf, muP, muS, alphaF, FzF);
         FyR = tireforces(Cr, muP, muS, alphaR, FzR);
         
         de = Uy*cos(dPsi) + Ux*sin(dPsi);
         ddPsi = r - K*Ux;
         dBeta =  1/Ux*((FyF + FyR)/m - r*Ux);
         dr = (a*FyF - b*FyR)/Iz;
         
         e = e + dt*de;
         Uy = beta*Ux;
         dPsi = dPsi + dt*ddPsi;
         beta = beta + dt*dBeta;
         r = r + dt*dr;
         
     end
    
     out.e = e;
     out.dPsi = dPsi;
     out.r =r ;
     out.beta = beta;
     out.deltaFFW = deltaFFW;


end
     

     
