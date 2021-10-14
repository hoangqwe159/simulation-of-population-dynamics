function k3k4 = SweepK3K4(tol, minK, maxK, inc, minT, maxT, X1_init, X2_init, k1, k2, k5)
tspan = [minT maxT];                                        
X0 = [X1_init X2_init];                                         
potential_k = linspace(minK,maxK,((maxK-minK)/inc)+1);      
k3k4 = zeros(length(potential_k),3);    
j = 1;                                                  
for k3i = potential_k 
    for k4i = potential_k
        [~,X] = ode45(@(t,X)ParasiteGrowthModel(t,X,k1,k2,k3i,k4i,k5), tspan, X0);         
        if all(all(X >= 0)) && ((X(end,1) <= tol) || (abs(X(end,2)-2) <= tol))   
            k3k4(j,1) = k3i;                        % records successful values of k3
            k3k4(j,2) = k4i;
            if (abs(X(end,2)-2) <= tol)
                k3k4(j,3) = 1;                    % sets coded value to 1 if X2 is an element of [2 - tol, 2 + tol] at T = 20
                if (abs(X(end,1)) <= tol)
                    k3k4(j,3) = 2;                % sets coded value to 2 if X1 is also an element of [0, tol] at T = 20
                end
            end
            j = j + 1;                          % increases index k3 recording index by 1
        end
    end
end
k3k4 = k3k4(1:j-1,:);                           % removes unnecessary/unused rows of k3
end

