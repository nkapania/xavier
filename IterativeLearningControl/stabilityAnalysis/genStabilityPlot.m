close all; clear all; clc;

N = 10; ts = .1; wc = 2*2*pi;
sys = getSys(20,ts); A = sys.a; B = sys.b; C = sys.c;
filter = getLowPass(wc, ts); qA = filter.a; qB = filter.B; qC = filter.c;

for i = 1:N
    p(i) = C*A^(i-1)*B;
    q(i) = qC*qA^(i-1)*qB;
end

P = toeplitz(p, zeros(N,1));
Q = toeplitz(q, zeros(N,1));
%Q = eye(N);

M = 50; kp = linspace(0, .1, M); kd = linspace(0, .75, M);

for i = 1:M
    for j = 1:M
        
        L = -(kp(i)+kd(j))*diag(ones(N,1)) + kd(j)*diag(ones(N-1,1),-1);
        
        S(i,j) = max(abs(eig(Q*(eye(N)+L*P))));
        J = P*Q*(eye(N) + L*P)*inv(P);
        MS(i,j) = max(svds(J));
        
    end
end



%%


[X,Y] = meshgrid(kp, kd);
[C h] = contour(X, Y, MS,'LineWidth',2);
%set(h,'ShowText','on','TextStep',get(h,'LevelStep')*1)
clabel(C,h,'FontSize',14)
colormap gray

xlabel('k_p (rad/m)','FontSize',14,'FontName','Arial'); hold on;
ylabel('k_d (rad/m)','FontSize',14,'FontName','Arial'); hold on;
% 
% %%
% t = linspace(0,5,1000);
% x = .73 + t*(.423 - .73);
% y = 0    + t*(13.46);
% figure;
% set(gca,'FontSize',12,'FontName','Arial'); %,'Position',[.13 .262 .852 .178]); 
% plot(x, y,'LineWidth',2);
% 
% xlabel('k_p (rad/m)','FontSize',14,'FontName','Arial'); hold on;
% ylabel('k_d (rad/m)','FontSize',14,'FontName','Arial'); hold on;
% legend('Asymptotically Stable')
% 
% xlim([0 .9]);
% ylim([0 35]);