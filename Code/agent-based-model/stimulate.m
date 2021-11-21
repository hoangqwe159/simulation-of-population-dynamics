function [parasite_array, food_array] = stimulate(domain, parasites, food, iterations, f1, f2, f3, video)


% video writer
file = "stimulation.avi";
domain_size = 200;


if video
    video_writer = VideoWriter(file);
    open(video_writer);
    fig = figure;
    axis([1 domain_size 1 domain_size]);
end

% initializae output array
parasite_array = zeros(1, iterations);
food_array = zeros(1, iterations);



for iteration = 1:iterations
    if video
        figure(fig);
    end
    n_parasites = size(parasites, 1);
    
    
    for i = 1:n_parasites 
      
        % if parasite is alive
        if parasites(i, 1) ~= 0        
            current_row = parasites(i, 1:1);
            current_col = parasites(i, 2:2);
            
            % parasite moves randomly
            u = rand;            
            if u < 0.25  
                next_col = current_col;
                next_row = current_row + 1;
            elseif u < 0.5          
                next_col = current_col;
                next_row = current_row - 1;
            elseif u < 0.75
                next_col = current_col + 1;
                next_row = current_row;
            else
                next_col = current_col - 1;
                next_row = current_row;
            end

            % parasite dies after f1 iterations
            if parasites(i, 3:3) == f1 + 1
                parasites(i, 1:2) = [0 0];
                domain(current_row, current_col) = 0;

            % validate new position of parasite
            elseif next_col >= 1 && next_col <= domain_size && next_row >= 1 && next_row <= domain_size

                % if new position is occupied by food
                if domain(next_row, next_col) == -1
                    % the food in domain is replaced by a parasite
                    domain(next_row, next_col) = 1;

                    % remove the food from list                    
                    food_index = find(ismember(food,[next_row next_col], 'rows'));
                    food(food_index, :) = [0 0];

                    % parasite replaces the food
                    parasites(i, 1:2) = [next_row, next_col];

                    % new parasite is placed in the orginal cell
                    parasites(end + 1, :) = [current_row, current_col, 0];

                % if new position is empty
                elseif domain(next_row, next_col) == 0
                    parasites(i, 1:2) = [next_row, next_col];   
                    domain(current_row, current_col) = 0;
                    domain(next_row, next_col) = 1;
                end
            end    
        end
    end
    
    % incsrease f1 of parasite after each iteration
    parasites(:, 3) = parasites(:, 3) + 1;

    n_food = size(food, 1);

    % food is removed if u < f2
    for i = 1:n_food
       if food(i, 1) ~= 0
          u = rand;
          if u < f2            
             domain(food(i, 1), food(i, 2)) = 0;
             food(i, :) = [0 0];
          end 
       end
    end
    
    % create f3 new food agents at random position
    for i = 1:f3
        col = randi([1 domain_size]);
        row = randi([1 domain_size]);
        
        while domain(row, col) == -1 || domain(row, col) == 1
            col = randi([1 domain_size]);
            row = randi([1 domain_size]); 
        end

        domain(row, col) = -1;
        food(end + 1, :) = [row col];
    end
   
    
    if video && mod(iteration, 4) == 0
        plot(parasites(:, 2), parasites(:, 1), 'r.', 'MarkerSize', 10);
        hold on;
        plot(food(:, 2), food(:, 1), 'b.', 'MarkerSize', 10);
        hold off;
        axis([1 domain_size 1 domain_size]);
        frame = getframe(gcf);
        writeVideo(video_writer, frame);
    end
    
    % remove dead parasite
    parasites = parasites(parasites(:, 1) ~= 0,:);
    food = food(food(:, 1) ~= 0, : );
         
    % cout number of parasites and food after each iteration
    parasite_array(iteration) = size(parasites, 1);
    food_array(iteration) = size(food, 1);
end

if video
    close(video_writer);
end

end