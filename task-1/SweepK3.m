function [k3] = SweepK3(tol, k1, k2, k4, k5)
% Function perform parameter sweep for k3. It use ODE45 function to solve
% the differential equations. Then apply conditions into the solutions and
% record the successful value of k.
%
% It also keep records of what condition the parameter satisfied. For
% example, if the parameter only satisfies the condition X1 -> 0 + Tol, then
% the code is 0. If it only satisfies X2 -> 2 +- Tol, we encode 1. And if
% it satisfies both conditions, we record 2.

% Inputs:
% tol:      Tol value.
% k1:       k1 value.
% k2:       k2 value.
% k4:       k4 value.
% k5:       k5 value.

k_min = 0;
k_max = 50;
k_inc = 0.1;
t_min = 0;
t_max = 20;
X1_init = 1;
X2_init = 1;

tspan = [t_min t_max];                                        
X0 = [X1_init X2_init];                                         
potential_k = linspace(k_min,k_max,((k_max-k_min)/k_inc)+1);    
k3 = zeros(length(potential_k),2);              % The vector has 2 columns, 1 to store the value of k, the other is for the condition it satisfied.                   
j = 1;                                                  
for k3i = potential_k                                  
    [~,X] = ode45(@(t,X)ParasiteGrowthModel(t,X,k1,k2,k3i,k4,k5), tspan, X0);         
    if isSuccessful(X, tol)  
        k3(j,1) = k3i;                          % records successful values of k3
        if (abs(X(end,2)-2) <= tol)
            k3(j,2) = 1;                        % write 1 if X2 is an element of [2 - tol, 2 + tol] at T = 20
            if (abs(X(end,1)) <= tol)
                k3(j,2) = 2;                    % write 2 if X1 is also an element of [0, tol] at T = 20
            end
        end
        j = j + 1;                              % increases recording index by 1
    end
end
k3 = k3(1:j-1,:);                               % removes unnecessary/unused rows
end
