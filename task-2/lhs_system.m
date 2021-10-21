function valid = lhs_system(tol, time, x0, k1, k2, X)
% tol = tolerance
% k1
% k2
% X = lhs matrix

% generates a column vector indicating whether each latin hypercube sample
% is valid according to the specification
% 0 = unsuccessful 1 = successful

valid = zeros(length(X(:,1)), 1);

for i = 1:length(X(:,1))
    k3 = X(i,1);
    k4 = X(i,2);
    k5 = X(i,3);
    [~,y] = ode45(@(t,y0) model(t, y0, k1, k2, k3, k4, k5), time, x0);
    
    if (all(all(y >= 0)) && abs(y(end,1)) <= tol) || (abs(y(end,2) - 2) <= tol)
        valid(i) = 1;
    end
end
end

function [res] = model(~, y0, k1, k2, k3, k4, k5)
    dx1 = y0(1) * k1 * y0(2) - k2 * y0(1);
    dx2 = k3 - k4 * y0(2) - k5 * y0(1);
    res = zeros(2,1);
    res(1) = dx1;
    res(2) = dx2;
end