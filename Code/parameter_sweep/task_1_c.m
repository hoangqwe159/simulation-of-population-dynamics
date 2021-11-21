%% Perform parameter sweep for k3 and k4, k increament = 0.5
Tol_1 = 10^-1;
Tol_2 = 10^-2;
k1 = 1;
k2 = 2;
k5 = 3;
[k3k4_big_tol] = SweepK3K4(Tol_1,k1,k2,k5); % Tol = 10^-1
[k3k4_small_tol] = SweepK3K4(Tol_2,k1,k2,k5); % Tol = 10^-2
%% Plot Tol = 10^-1
figure

gscatter(k3k4_big_tol(:,1),k3k4_big_tol(:,2),k3k4_big_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol')
xlabel('k3')
ylabel('k4')
xlim([0 50])
hold on
plot([1 50], [0.5 26], 'black','LineWidth', 1.5)
plot([1 50], [0.5 4.5], 'r','LineWidth', 1.5)
plot([1 2.5], [0.5 50], 'blue','LineWidth', 1.5)
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol', 'k_4 = 0.52k_3 - 0.02','k_4 = 0.08k_3 + 0.42','k_4 = 33.0k_3 - 32.5' )
hold off
title({'Parameter Sweep k3 and k4 for Tol = 10^{-1}'})
%% Plot Tol = 10^-2
figure
gscatter(k3k4_small_tol(:,1),k3k4_small_tol(:,2),k3k4_small_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
xlabel('k3')
ylabel('k4')
xlim([0 50])
hold on
plot([1 50], [0.5 4.5], 'black', 'LineWidth', 1.5)
plot([1 50], [0.5 28], 'r', 'LineWidth', 1.5)
plot([1 50], [0.5 24], 'green','LineWidth', 1.5)
plot([1 2.5], [0.5 50], 'blue','LineWidth', 1.5)
hold off
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol', 'k_4 = 0.08k_3 + 0.42','k_4 = 0.56k_3 - 0.06', 'k_4 = 0.48k_3 + 0.02', 'k_4 = 33.0k_3 - 32.5')
title({'Parameter Sweep k3 and k4 for Tol = 10^{-2}'})