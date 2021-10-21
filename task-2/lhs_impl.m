function [X] = lhs_impl(n, d, range)
% n = number of samples
% d = number of dimensions
% range = [lower upper]

% lhs_impl produces a valid latin hypercube sample over d dimensions
% the code generates a upper / n stratifications then randomly selects a
% valid set of stratifications at each grid location

% Output X is the valid set of latin hypercube sample coordinates over d
% dimensions

X = zeros(n,d);
cell = range(2) / n;
rx = range(1):cell:range(2);
stratas = zeros(2, length(rx) -1);

for i=1:1:length(rx)-1
    stratas(:,i) = [rx(i) rx(i+1)];
end

for i=1:1:d
    arr = zeros(n,1);
    av = stratas;
    
    for j=1:1:n-1
        l = randi([1, length(av)]);
        s = av(:,l);
        v = s(1) + rand*(s(2)-s(1));
        arr(j) = v;
        av(:,l) = [];
    end
    
    v = av(1) + rand*(av(2)-av(1));
    arr(n) = v;
    X(:,i) = arr;
end
end