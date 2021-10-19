function valid = lhs_system(tol, time, x0, k1, k2, X)
% tol = tolerance
% k1
% k2
% X = lhs matrix

% x1 = k1 * X1 * X2 - k2 * X1
% x2 = k3 - k4 * X2 - k5 * X1

for i = 1:length(X(:,1))
    k3 = X(i,1);
    k4 = X(i,2);
    k5 = X(i,3);
    [~,y] = ode45(@(t,y0) eqns(t, y0, k1, k2, k3, k4, k5), time, x0);
end
end

function [res] = eqns(tspan, y0, k1, k2, k3, k4, k5)
    dx1 = y0(1) * k1 * y0(2) - k2 * y0(1);
    dx2 = k3 - k4 * y0(2) - k5 * y0(1);
    res = zeros(2,1);
    res(1) = dx1;
    res(2) = dx2;
end