function mask = parasite_spatial_mask(density, food_mask )
%PARASITE_SPATIAL_MASK

grid_width = 200;
population = density * grid_width^2;
mask = zeros(grid_width, grid_width);

for i = 1:population
   
    x = randi([1 grid_width]);
    y = rand([1 grid_width]);
    
    while food_mask(y, x) == 1 || mask(y, x) == 1
        x = randi([1 grid_width]);
        y = rand([1 grid_width]);
    end
    
    mask(y, x) = 1;
    
end

end

