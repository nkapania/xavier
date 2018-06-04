function plotTireForces(Cf, Cr, muP, muS, m, a, b)

L = a + b;
g = 9.81;

Fz = m*g*[b/L; a/L];

alphaSlideF = abs( atan(3*muP*m*b/L*9.81/Cf) );
alphaFrontTable=[0:.001:alphaSlideF];   % vector of front alpha (rad)
FyFtable = tireforces(Cf,muP,muS,alphaFrontTable,Fz(1));

alphaSlideR = abs( atan(3*muP*m*a/L*9.81/Cr));
alphaRearTable = (0:.001:alphaSlideR);
FyRtable = tireforces(Cr, muP, muS, alphaRearTable, Fz(2));

figure
plot(alphaFrontTable*180/pi, abs(FyFtable));
hold on
plot(alphaRearTable*180/pi, abs(FyRtable),'r');
grid on
xlabel('\alpha (deg)')
ylabel('|Fy| (N)')
legend('Front','Rear')

end