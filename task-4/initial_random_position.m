function [domain, food, parasites] = initial_random_position(density)
% initial_random_position Position food and parasites randomly
%   Return food location, parasites location, and cells vacated in domain

domain_size = 200;
population = density * domain_size * domain_size;
domain = zeros(domain_size, domain_size);

parasites = zeros(population, 3);
food = zeros(population, 2);

% cell vacated by food is -1
% cell vacated by parasite is 1
% empty cell is 0

% position food in the domain
for i = 1:population    
    row = randi([1 domain_size]);
    col = randi([1 domain_size]);
    
    while domain(row, col) == -1
       row = randi([1 domain_size]);
       col = randi([1 domain_size]); 
    end
    
    domain(row, col) = -1;
    food(i, :) = [row, col]; 
end

% position parasites in the domain
for i = 1:population   
    row = randi([1 domain_size]);
    col = randi([1 domain_size]);
    
    while domain(row, col) == -1 || domain(row, col) == 1
        row = randi([1 domain_size]);
        col = randi([1 domain_size]);
    end
    
    domain(row, col) = 1;
    parasites(i, 1:2) = [row, col];
end

end