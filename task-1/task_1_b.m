%% Perform parameter sweep for only k3, k increament = 0.2
Tol_1 = 10^-1;
Tol_2 = 10^-1;
k_min = 0;
k_max = 50;
k_inc = 0.2;
t_min = 0;
t_max = 20;
X1_init = 1;
X2_init = 1;
k1 = 1;
k2 = 2;
k4 = 4;
k5 = 5;
[k3t1] = SweepK3(Tol_1,k_min,k_max,k_inc,t_min,t_max,X1_init,X2_init,k1,k2,k4,k5); % Tol = 10^-1
[k3t2] = SweepK3(Tol_2,k_min,k_max,k_inc,t_min,t_max,X1_init,X2_init,k1,k2,k4,k5); % Tol = 10^-2
%% Plot Tol = 10^-1
figure
scatter(k3t1(:,1),k3t1(:,2),1);
%% Plot Tol = 10^-2