function [k3] = SweepK3(tol, k_min, k_max, k_inc, t_min, t_max, X1_init, X2_init, k1, k2, k4, k5)
% Function perform parameter sweep for k3. It use ODE45 function to solve
% the differential equations. Then apply conditions into the solutions and
% record the successful value of k.

% Inputs:
% tol:      Tol value.
% k_min:    Lower limit of k.
% k_max:    Upper limit of k.
% k_inc:    Increment of k value.
% t_min:    Lower bound of time.
% t_max:    Upper bound of time.
% X1_init:  Initial value of X1.
% X2_init:  Initial value of X2.
% k1:       k1 value.
% k2:       k2 value.
% k4:       k4 value.
% k5:       k5 value.

tspan = [t_min t_max];                                        
X0 = [X1_init X2_init];                                         
potential_k = linspace(k_min,k_max,((k_max-k_min)/k_inc)+1);      
k3 = zeros(length(potential_k),2);                  
j = 1;                                                  
for k3i = potential_k                                 
    [~,X] = ode45(@(t,X)ParasiteGrowthModel(t,X,k1,k2,k3i,k4,k5), tspan, X0);         
    if all(all(X >= 0)) && ((X(end,1) <= tol) || (abs(X(end,2)-2) <= tol))   
        k3(j,1) = k3i;                        % records successful values of k3
        if (abs(X(end,2)-2) <= tol)
            k3(j,2) = 1;                    % sets coded value to 1 if X2 is an element of [2 - tol, 2 + tol] at T = 20
            if (abs(X(end,1)) <= tol)
                k3(j,2) = 2;                % sets coded value to 2 if X1 is also an element of [0, tol] at T = 20
            end
        end
        j = j + 1;                          % increases index k3 recording index by 1
    end
end
k3 = k3(1:j-1,:);                           % removes unnecessary/unused rows of k3

end
