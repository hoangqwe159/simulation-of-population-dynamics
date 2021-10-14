function Model = ParasiteGrowthModel(t, X, k1, k2, k3, k4, k5)
    Model = zeros(2,1);
    Model(1) = k1*X(1)*X(2) - k2*X(1);
    Model(2) = k3 - k4*X(2) - k5*X(1);
end

