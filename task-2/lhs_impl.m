function [X] = lhs_impl(n, d, range)
% n = number of samples
% d = number of dimensions
% range = [lower upper]

X = [];
o = rng;

cell = range(2) / n;
rx = range(1):cell:range(2);
stratas = [];
for i=1:1:length(rx)-1
    stratas = [stratas [rx(i); rx(i+1)]];
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
    X = [X arr];
end
end