function [parasite_array, food_array] = stimulate(domain, parasites, food, iterations, f1, f3, f2)


% video writer
file = "stimulation.avi";
video = true;
domain_size = 200;
video_writer = VideoWriter(file);
open(video_writer);

if video
    fig = figure;
    axis([1 domain_size 1 domain_size]);
end

% initializae output array
parasite_array = zeros(1, iterations);
food_array = zeros(1, iterations);



for step = 1:iterations
    if video
        figure(fig);
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
            if parasites(i, 3:3) == f1 + 1
                parasites(i, 1:2) = [-1 -1];
                domain(old_y, old_x) = 0;

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
          if rand < f2
             y_pos = food(i, 1);
             x_pos = food(i, 2);
             
             domain(y_pos, x_pos) = 0;
             food(i, :) = [-1 -1];
          end 
       end
    end
    
    % Food generation at random location
    for i = 1:f3
        x = randi([1 200]);
        y = randi([1 200]);
        while domain(y, x) == -1 || domain(y, x) == 1
            x = randi([1 200]);
            y = randi([1 200]); 
        end

        domain(y, x) = -1;
        food(end + 1, :) = [y x];
    end
   
    
    if video && mod(step, 5) == 0
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
    parasite_array(step) = length(parasites);
    food_array(step) = length(food);
end

if video
    close(video_writer);
end

end