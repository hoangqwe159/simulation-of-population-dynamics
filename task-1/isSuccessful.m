function bool = isSuccessful(X, tol)
% The function determine whether the system satisfies all the condition

% Inputs:
% X:    System value.
% Tol:  Tol value.
bool = all(all(X >= 0)) && ((X(end,1) <= tol) || (abs(X(end,2)-2) <= tol));
end

