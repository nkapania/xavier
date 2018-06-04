function [A, B] = getJacobian(e, dPsi, r, beta, v, UxD, deltaL, fL, veh, ts, K, AxDes)

%get linearized A matrix by numerically approximating Jacobian

del = 1e-5;

A = zeros(5);
B = zeros(5, 2);

A(1,1) =  (getEdot(e + del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh) - getEdot(e - del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh))/(2*del);
A(1,2) =  (getEdot(e      , dPsi + del, r      , beta      , v      , UxD, deltaL, fL, veh) - getEdot(e      , dPsi - del, r      , beta      , v      , UxD, deltaL, fL, veh))/(2*del);
A(1,3) =  (getEdot(e      , dPsi      , r + del, beta      , v      , UxD, deltaL, fL, veh) - getEdot(e      , dPsi      , r - del, beta      , v      , UxD, deltaL, fL, veh))/(2*del);
A(1,4) =  (getEdot(e      , dPsi      , r      , beta + del, v      , UxD, deltaL, fL, veh) - getEdot(e      , dPsi      , r      , beta - del, v      , UxD, deltaL, fL, veh))/(2*del);
A(1,5) =  (getEdot(e      , dPsi      , r      , beta      , v + del, UxD, deltaL, fL, veh) - getEdot(e      , dPsi      , r      , beta      , v - del, UxD, deltaL, fL, veh))/(2*del);
B(1,1) =  (getEdot(e, dPsi,r,beta,v,UxD,deltaL + del, fL      , veh) - getEdot(e, dPsi, r, beta, v, UxD, deltaL - del, fL      , veh))/(2*del);
B(1,2) =  (getEdot(e, dPsi,r,beta,v,UxD,deltaL      , fL + del, veh) - getEdot(e, dPsi, r, beta, v, UxD, deltaL      , fL - del, veh))/(2*del);

A(2,1) =  (getDpsiDot(e + del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh) - getDpsiDot(e - del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh))/(2*del);
A(2,2) =  (getDpsiDot(e      , dPsi + del, r      , beta      , v      , UxD, deltaL, fL, veh) - getDpsiDot(e      , dPsi - del, r      , beta      , v      , UxD, deltaL, fL, veh))/(2*del);
A(2,3) =  (getDpsiDot(e      , dPsi      , r + del, beta      , v      , UxD, deltaL, fL, veh) - getDpsiDot(e      , dPsi      , r - del, beta      , v      , UxD, deltaL, fL, veh))/(2*del);
A(2,4) =  (getDpsiDot(e      , dPsi      , r      , beta + del, v      , UxD, deltaL, fL, veh) - getDpsiDot(e      , dPsi      , r      , beta - del, v      , UxD, deltaL, fL, veh))/(2*del);
A(2,5) =  (getDpsiDot(e      , dPsi      , r      , beta      , v + del, UxD, deltaL, fL, veh) - getDpsiDot(e      , dPsi      , r      , beta      , v - del, UxD, deltaL, fL, veh))/(2*del);
B(2,1) =  (getDpsiDot(e, dPsi,r,beta,v,UxD,deltaL + del, fL      , veh) - getDpsiDot(e, dPsi, r, beta, v, UxD, deltaL - del, fL      , veh))/(2*del);
B(2,2) =  (getDpsiDot(e, dPsi,r,beta,v,UxD,deltaL      , fL + del, veh) - getDpsiDot(e, dPsi, r, beta, v, UxD, deltaL      , fL - del, veh))/(2*del);

A(3,1) =  (getRdot(e + del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getRdot(e - del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(3,2) =  (getRdot(e      , dPsi + del, r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getRdot(e      , dPsi - del, r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(3,3) =  (getRdot(e      , dPsi      , r + del, beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getRdot(e      , dPsi      , r - del, beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(3,4) =  (getRdot(e      , dPsi      , r      , beta + del, v      , UxD, deltaL, fL, veh, K, AxDes) - getRdot(e      , dPsi      , r      , beta - del, v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(3,5) =  (getRdot(e      , dPsi      , r      , beta      , v + del, UxD, deltaL, fL, veh, K, AxDes) - getRdot(e      , dPsi      , r      , beta      , v - del, UxD, deltaL, fL, veh, K, AxDes))/(2*del);
B(3,1) =  (getRdot(e, dPsi,r,beta,v,UxD,deltaL + del, fL      , veh, K, AxDes) - getRdot(e, dPsi, r, beta, v, UxD, deltaL - del, fL      , veh, K, AxDes))/(2*del);
B(3,2) =  (getRdot(e, dPsi,r,beta,v,UxD,deltaL      , fL + del, veh, K, AxDes) - getRdot(e, dPsi, r, beta, v, UxD, deltaL      , fL - del, veh, K, AxDes))/(2*del);

A(4,1) =  (getBetaDot(e + del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getBetaDot(e - del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(4,2) =  (getBetaDot(e      , dPsi + del, r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getBetaDot(e      , dPsi - del, r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(4,3) =  (getBetaDot(e      , dPsi      , r + del, beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getBetaDot(e      , dPsi      , r - del, beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(4,4) =  (getBetaDot(e      , dPsi      , r      , beta + del, v      , UxD, deltaL, fL, veh, K, AxDes) - getBetaDot(e      , dPsi      , r      , beta - del, v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(4,5) =  (getBetaDot(e      , dPsi      , r      , beta      , v + del, UxD, deltaL, fL, veh, K, AxDes) - getBetaDot(e      , dPsi      , r      , beta      , v - del, UxD, deltaL, fL, veh, K, AxDes))/(2*del);
B(4,1) =  (getBetaDot(e, dPsi,r,beta,v,UxD,deltaL + del, fL      , veh, K, AxDes) - getBetaDot(e, dPsi, r, beta, v, UxD, deltaL - del, fL      , veh, K, AxDes))/(2*del);
B(4,2) =  (getBetaDot(e, dPsi,r,beta,v,UxD,deltaL      , fL + del, veh, K, AxDes) - getBetaDot(e, dPsi, r, beta, v, UxD, deltaL      , fL - del, veh, K, AxDes))/(2*del);

A(5,1) =  (getVdot(e + del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getVdot(e - del, dPsi      , r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(5,2) =  (getVdot(e      , dPsi + del, r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getVdot(e      , dPsi - del, r      , beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(5,3) =  (getVdot(e      , dPsi      , r + del, beta      , v      , UxD, deltaL, fL, veh, K, AxDes) - getVdot(e      , dPsi      , r - del, beta      , v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(5,4) =  (getVdot(e      , dPsi      , r      , beta + del, v      , UxD, deltaL, fL, veh, K, AxDes) - getVdot(e      , dPsi      , r      , beta - del, v      , UxD, deltaL, fL, veh, K, AxDes))/(2*del);
A(5,5) =  (getVdot(e      , dPsi      , r      , beta      , v + del, UxD, deltaL, fL, veh, K, AxDes) - getVdot(e      , dPsi      , r      , beta      , v - del, UxD, deltaL, fL, veh, K, AxDes))/(2*del);
B(5,1) =  (getVdot(e, dPsi,r,beta,v,UxD,deltaL + del, fL      , veh, K, AxDes) - getVdot(e, dPsi, r, beta, v, UxD, deltaL - del, fL      , veh, K, AxDes))/(2*del);
B(5,2) =  (getVdot(e, dPsi,r,beta,v,UxD,deltaL      , fL + del, veh, K, AxDes) - getVdot(e, dPsi, r, beta, v, UxD, deltaL      , fL - del, veh, K, AxDes))/(2*del);

[A, B] = myc2d(A, B, ts);

end

