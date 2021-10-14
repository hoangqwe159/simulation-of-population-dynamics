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
k5 = 3;
[k3k4_big_tol] = SweepK3K4(Tol_1,k_min,k_max,k_inc,t_min,t_max,X1_init,X2_init,k1,k2,k5); % Tol = 10^-1
[k3k4_small_tol] = SweepK3K4(Tol_2,k_min,k_max,k_inc,t_min,t_max,X1_init,X2_init,k1,k2,k5); % Tol = 10^-2
%% Plot Tol = 10^-1
figure

gscatter(k3k4_big_tol(:,1),k3k4_big_tol(:,2),k3k4_big_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol')
xlabel('k3')
ylabel('k4')
xlim([0 50])
title({'Parameter Sweep k3 and k4 for Tol = 10^{-1}'})
%% Plot Tol = 10^-2
figure
gscatter(k3k4_small_tol(:,1),k3k4_small_tol(:,2),k3k4_small_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol')
xlabel('k3')
ylabel('k4')
xlim([0 50])
title({'Parameter Sweep k3 and k4 for Tol = 10^{-1}'})