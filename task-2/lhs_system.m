function valid = lhs_system(tol, time, x0, k1, k2, X)
% tol = tolerance
% time = time span of simulation
% k1 = birth rate
% k2 = death rate
% X = sample where X(:,1) is good growth, X(:,2) is food decay and X(:,3)
% is food consumption

% generates a column vector indicating whether each latin hypercube sample
% is valid according to the specification
% 0 = unsuccessful 1 = successful

valid = zeros(length(X(:,1)), 1);

k3 = X(:,1);
k4 = X(:,2);
k5 = X(:,3);

for i = 1:length(X(:,1))
    [~,y] = ode45(@(t,y0) model(t, y0, k1, k2, k3(i), k4(i), k5(i)), time, x0);

    % X -> 0 + tol
    if all(all(y >= 0)) && y(end,1) <= tol
        valid(i) = 1;
    end

    % X -> 2 +/- tol
    if abs(y(end,2) - 2) <= tol
        valid(i) = 1;
    end
end
end

function [res] = model(~, y, k1, k2, k3, k4, k5)
    dx1 = y(1) * k1 * y(2) - k2 * y(1);
    dx2 = k3 - k4 * y(2) - k5 * y(1);
    res = zeros(2,1);
    res(1) = dx1;
    res(2) = dx2;
end