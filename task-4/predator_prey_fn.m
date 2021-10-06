function predator_prey = predator_prey_fn(t, x, k1, k2, k3, k4, k5)
% PREDATOR_PREY_FN 
% k1, k2, k3, k4: model parameters
% x: population vector

predator_prey = zeros(2, 1);
predator_prey(1) = k1*x(1)*x(2) - k2*x(1);
predator_prey(2) = k3 - k4*x(2) - k5*x(1);

end

