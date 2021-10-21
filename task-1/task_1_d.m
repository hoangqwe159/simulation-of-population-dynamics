%% Perform parameter sweep for only k3, k increament = 0.5
Tol_1 = 10^-1;
Tol_2 = 10^-2;
k_min = 0;
k_max = 50;
k_inc = 0.5;
t_min = 0;
t_max = 20;
X1_init = 1;
X2_init = 1;
k1 = 1;
k2 = 2;
k3 = 10;
[k4k5_big_tol] = SweepK4K5(Tol_1,k_min,k_max,k_inc,t_min,t_max,X1_init,X2_init,k1,k2,k3); % Tol = 10^-1
[k4k5_small_tol] = SweepK4K5(Tol_2,k_min,k_max,k_inc,t_min,t_max,X1_init,X2_init,k1,k2,k3); % Tol = 10^-2
%% Plot Tol = 10^-1
figure

gscatter(k4k5_big_tol(:,1),k4k5_big_tol(:,2),k4k5_big_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
xlabel('k4')
ylabel('k5')
xlim([0 50])
hold on
plot([0.5 1.5 5], [3.5 0.5 0], 'blue','LineWidth', 1.5)
plot([1.5 11.5 46.5], [16 14 12], 'black','LineWidth', 1.5)
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol', 'k_5 = 0.635k_4^2 - 4.27k_4 + 5.48', 'k_5 = 0.003k_4^2 - 0.25k_4 + 16')
hold off
title({'Parameter Sweep k4 and k5 for Tol = 10^{-1}'})
%% Plot Tol = 10^-2
figure
gscatter(k4k5_small_tol(:,1),k4k5_small_tol(:,2),k4k5_small_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
xlabel('k4')
ylabel('k5')
xlim([0 50])
hold on
plot([0.5 1.5 5], [3.5 0.5 0], 'blue','LineWidth', 1.5)
plot([1.5 11.5 46.5], [16 14 12], 'black','LineWidth', 1.5)
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol', 'k_5 = 0.635k_4^2 - 4.27k_4 + 5.48', 'k_5 = 0.003k_4^2 - 0.25k_4 + 16')
hold off
title({'Parameter Sweep k4 and k5 for Tol = 10^{-2}'})