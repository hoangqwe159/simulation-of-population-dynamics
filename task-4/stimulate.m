function [pop_parasites, pop_food] = stimulate(domain, parasites, food, steps, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video)


% video writer
video_writer = VideoWriter(file_name);
open(video_writer);

% population counts
pop_parasites = zeros(1, steps);
pop_food = zeros(1, steps);

domain_size = 200;

% plot
if make_video
    f_id = figure;
    axis([1 domain_size 1 domain_size]);
end

for step = 1:steps
    if make_video
        figure(f_id);
    end
    num_parasites = size(parasites, 1);
    
    % Parasite movement
    for i = 1:num_parasites
        
        % check if it is dead
        if parasites(i, 1) ~= -1
        
            old_y = parasites(i, 1:1);
            old_x = parasites(i, 2:2);

            [dx, dy] = random_movement();
            new_x = old_x + dx;
            new_y = old_y + dy;

            % parasite has reached peak age - delete it
            if parasites(i, 3:3) == parasite_max_age + 1
                parasites(i, 1:2) = [-1 -1];
                domain(old_y, old_x) = 1;

            % parasite has valid new position
            elseif new_x >= 1 && new_x <= 200 && new_y >= 1 && new_y <= 200

                % collision with food
                if domain(new_y, new_x) == -1

                    % add parasite to mask at new position
                    % leave parasite existing at initial position
                    domain(new_y, new_x) = 1;

                    % delete the food
                    % find the food at new_y, new_x
                    food_index = find(ismember(food,[new_y new_x], 'rows'));

                    % delete the food
                    food(food_index, :) = [-1 -1];

                    % update parasite's position
                    parasites(i, 1:2) = [new_y, new_x];

                    % add new parasite's position and age to vector
                    parasites(end + 1, :) = [old_y, old_x, 0];

                % empty space
                elseif domain(new_y, new_x) == 0
                    parasites(i, 1:2) = [new_y, new_x];   
                    % update mask
                    domain(old_y, old_x) = 0;
                    domain(new_y, new_x) = 1;
                end
            end    
        end
    end
    
    % age parasites
    parasites(:, 3) = parasites(:, 3) + 1;

    num_food = size(food, 1);

    % food deaths
    for i = 1:num_food
       if food(i, 1) ~= -1
          if rand < food_death_threshold
             x_pos = food(i, 1);
             y_pos = food(i, 2);
             
             domain(y_pos, x_pos) = 1;
             food(i, :) = [-1 -1];
          end 
       end
    end
    
    % Food generation at random location
    for i = 1:food_creation_num
        x = randi([1 200]);
        y = randi([1 200]);
        while domain(y, x) == 0.5 || domain(y, x) == 0
            x = randi([1 200]);
            y = randi([1 200]); 
        end

        domain(y, x) = -1;
        food(end + 1, :) = [y x];
    end
   
    
    if make_video && mod(step, 5) == 0
        plot(parasites(:, 2), parasites(:, 1), 'r.', 'MarkerSize', 10);
        hold on;
        plot(food(:, 2), food(:, 1), 'b.', 'MarkerSize', 10);
        hold off;
        axis([1 domain_size 1 domain_size]);
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