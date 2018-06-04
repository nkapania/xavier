%%
close all;
h(1) = subplot(2, 1, 1);
hold on; grid on;
ylim([-0.025 .03])
plot(s.s, s.K,'LineWidth',2)
plot(b.s, b.K,'r','LineWidth',2);

h(2) = subplot(2, 1, 2);
plot(s.s, s.UxDesired,'LineWidth',2)
ylim([15 60])
hold on; grid on;
plot(b.s, b.UxDesired,'r','LineWidth',2)

linkaxes(h,'x')
xlim([0 4600])