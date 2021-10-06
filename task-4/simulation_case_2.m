function [pop_parasites, pop_food] = simulation_case_2(mask, parasites, food, steps, grid_width, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video)
% Simulation Case 1: Food is reproduced in neighbouring cells

% video writer
video_writer = VideoWriter(file_name);
open(video_writer);

% population counts
pop_parasites = zeros(1, steps);
pop_food = zeros(1, steps);

% plot
if make_video
    f_id = figure;
    axis([1 grid_width 1 grid_width]);
end

for step = 1:steps
    if make_video
        figure(f_id);
    end
    num_parasites = size(parasites, 1);
    
    % Parasite movement
    for p = 1:num_parasites
        
        % check if it is dead
        if parasites(p, 1) ~= -1
        
            old_x = parasites(p, 1:1);
            old_y = parasites(p, 2:2);

            [dx, dy] = random_movement();
            new_x = old_x + dx;
            new_y = old_y + dy;

            % parasite has reached peak age - delete it
            if parasites(p, 3:3) == parasite_max_age + 1
                parasites(p, 1:2) = [-1 -1];
                mask(old_y, old_x) = 1;

            % parasite has valid new position
            elseif new_x >= 1 && new_x <= 200 && new_y >= 1 && new_y <= 200

                % collision with food
                if mask(new_y, new_x) == 0.5

                    % add parasite to mask at new position
                    % leave parasite existing at initial position
                    mask(new_y, new_x) = 0;

                    % delete the food
                    % find the food at new_y, new_x
                    food_index = find(ismember(food,[new_x new_y], 'rows'));

                    % delete the food
                    food(food_index, :) = [-1 -1];

                    % update parasite's position
                    parasites(p, 1:2) = [new_x, new_y];

                    % add new parasite's position and age to vector
                    parasites(end + 1, :) = [old_x, old_y, 0];

                % empty space
                elseif mask(new_y, new_x) == 1
                    parasites(p, 1:2) = [new_x, new_y];   
                    % update mask
                    mask(old_y, old_x) = 1;
                    mask(new_y, new_x) = 0;
                end
            end    
        end
    end
    
    % age parasites
    parasites(:, 3) = parasites(:, 3) + 1;

    num_food = size(food, 1);

    % food deaths
    for f = 1:num_food
       if food(f, 1) ~= -1
          if rand < food_death_threshold
             x_pos = food(f, 1);
             y_pos = food(f, 2);
             
             mask(y_pos, x_pos) = 1;
             food(f, :) = [-1 -1];
          end 
       end
    end
    
    % Food generation at random location
    for g = 1:food_creation_num
        x = randi([1 200]);
        y = randi([1 200]);
        while mask(y, x) == 0.5 || mask(y, x) == 0
            x = randi([1 200]);
            y = randi([1 200]); 
        end

        mask(y, x) = 0.5;
        food(end + 1, :) = [x y];
    end
   
    
    if make_video && mod(step, 5) == 0
        plot(parasites(:, 1), parasites(:, 2), 'r.', 'MarkerSize', 10);
        hold on;
        plot(food(:, 1), food(:, 2), 'b.', 'MarkerSize', 10);
        hold off;
        axis([1 grid_width 1 grid_width]);
        frame = getframe(gcf);
        writeVideo(video_writer, frame);
    end
    
    % reallocate matrices
    mask_of_live_parasites = parasites(:, 1) ~= -1;
    parasites = parasites(mask_of_live_parasites, :);

    mask_of_live_food = food(:, 1) ~= -1;
    food = food(mask_of_live_food, :);
         
    % record population values
    pop_parasites(step) = length(parasites);
    pop_food(step) = length(food);
end

if make_video
    close(video_writer);
end

end

