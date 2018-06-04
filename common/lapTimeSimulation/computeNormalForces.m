%account for weight transfer with a simple static assumption.

function [Fzf Fzr] = computeNormalForces(m, a, b, L, h, Ax)

g = 9.81;

Fzf = m/L*(b*g - h*Ax);
Fzr = m/L*(a*g + h*Ax);