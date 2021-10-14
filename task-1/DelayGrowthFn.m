function Model = DelayGrowthFn(t,X,Z,r,K)
% Simple time lag population growth model.
% Input variable 
% t:    Time
% X:    Population size.
% Z:    Time lag history function
% r:    Growth rate.
% K:    Carrying capacity.
Xlag = Z(:,1);
Model = [r*X*(1-Xlag/K)];
end

