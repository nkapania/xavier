muPtable = muPest;
muStable = muSest;

% 

alphaSlideFest = abs( atan(3*muPtable*mEst*b/L*9.81/CfEst) );
alphaSlideRest = abs( atan(3*muPtable*mEst*a/L*9.81/CrEst) );
alphaFrontEst=[-alphaSlideFest:.01:alphaSlideFest];   % vector of front alpha (rad)
alphaRearEst=[-alphaSlideRest:.01:alphaSlideRest];   % vector of rear alpha (rad)

FyFest = tireforces(CfEst,muPtable,muStable,alphaFrontEst,mEst*b/L*9.81);
FyRest = tireforces(CrEst,muPtable,muStable,alphaRearEst,mEst*a/L*9.81);


