%% Perform parameter sweep for only k3, k increament = 0.5
Tol_1 = 10^-1;
Tol_2 = 10^-2;
k1 = 1;
k2 = 2;
k3 = 10;
[k4k5_big_tol] = SweepK4K5(Tol_1,k1,k2,k3); % Tol = 10^-1
[k4k5_small_tol] = SweepK4K5(Tol_2,k1,k2,k3); % Tol = 10^-2
%% Plot Tol = 10^-1
figure

gscatter(k4k5_big_tol(:,1),k4k5_big_tol(:,2),k4k5_big_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
xlabel('k4')
ylabel('k5')
xlim([0 50])
hold on
plot([0.5 5], [3.5 0], 'blue','LineWidth', 1.5)
x = 0:0.5:50;
y = 0.0027*x.^2 - 0.2203*x + 16.3244;
plot(x, y, 'black','LineWidth', 1.5)
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol','X1 \rightarrow 0 + tol and X2 \rightarrow 2 ± tol', 'k_5 = -0.78k_4 + 3.89', 'k_5 = 0.0027k_4^2 - 0.2203k_4 + 16.3244')
hold off
title({'Parameter Sweep k4 and k5 for Tol = 10^{-1}'})
%% Plot Tol = 10^-2
figure
gscatter(k4k5_small_tol(:,1),k4k5_small_tol(:,2),k4k5_small_tol(:,3),[1 0.5 0; 0.5 0 1; 0 1 0.5]);
xlabel('k4')
ylabel('k5')
xlim([0 50])
hold on
plot([0.5 5], [3.5 0], 'blue','LineWidth', 1.5)
x = 0:0.5:50;
y = 0.0027*x.^2 - 0.2203*x + 16.3244;
plot(x, y, 'black','LineWidth', 1.5)
legend('X1 \rightarrow 0 + tol','X2 \rightarrow 2 ± tol', 'k_5 = -0.78k_4 + 3.89', 'k_5 = 0.0027k_4^2 - 0.2203k_4 + 16.3244')
hold off
title({'Parameter Sweep k4 and k5 for Tol = 10^{-2}'})