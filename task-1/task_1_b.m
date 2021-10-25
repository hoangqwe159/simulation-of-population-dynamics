%% Perform parameter sweep for only k3, k increament = 0.1
Tol_1 = 10^-1;
Tol_2 = 10^-2;
k1 = 1;
k2 = 2;
k4 = 4;
k5 = 3;
[k3_big_tol] = SweepK3(Tol_1,k1,k2,k4,k5); % Tol = 10^-1
[k3_small_tol] = SweepK3(Tol_2,k1,k2,k4,k5); % Tol = 10^-2
%% Plot Tol = 10^-1
figure
gscatter(k3_big_tol(:,1),zeros(length(k3_big_tol),1),k3_big_tol(:,2),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol')
xlabel('k3')
xlim([0 50])

title({'Parameter Sweep k3 for Tol = 10^{-1}'})
%% Plot Tol = 10^-2
figure
gscatter(k3_small_tol(:,1),zeros(length(k3_small_tol),1),k3_small_tol(:,2),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol')
xlabel('k3')
xlim([0 50])
title({'Parameter Sweep k3 for Tol = 10^{-2}'})