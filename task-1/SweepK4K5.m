function k4k5 = SweepK4K5(tol, k1, k2, k3)
% Function perform parameter sweep for k4 and k5. It use ODE45 function to solve
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
% k3:       k3 value.
k_min = 0;
k_max = 50;
k_inc = 0.5;
t_min = 0;
t_max = 20;
X1_init = 1;
X2_init = 1;

tspan = [t_min t_max];                                        
X0 = [X1_init X2_init];                                         
potential_k = linspace(k_min,k_max,((k_max-k_min)/k_inc)+1);      
k4k5 = zeros(length(potential_k),3);    
j = 1;                                                  
for k4i = potential_k 
    for k5i = potential_k
        [~,X] = ode45(@(t,X)ParasiteGrowthModel(t,X,k1,k2,k3,k4i,k5i), tspan, X0);         
        if isSuccessful(X, tol)      
            k4k5(j,1) = k4i;                        % records successful values of k4
            k4k5(j,2) = k5i;                        % records successful values of k5
            if (abs(X(end,2)-2) <= tol)
                k4k5(j,3) = 1;                      % write 1 if X2 is an element of [2 - tol, 2 + tol] at T = 20
                if (abs(X(end,1)) <= tol)
                    k4k5(j,3) = 2;                  % write 2 if X1 is also an element of [0, tol] at T = 20
                end
            end
            j = j + 1;                              % increases recording index by 1
        end
    end
end
k4k5 = k4k5(1:j-1,:);                               % removes unnecessary/unused rows
end

