function sol = DelayGrowthSolution(X0, r, s, h , K, steps)
tspan = [0 h*steps];
lags = s * h;
sol = dde23(@(t,X,Z)DelayGrowthFn(t,X,Z, r, K), lags, @(t)history(t,X0), tspan);
end

