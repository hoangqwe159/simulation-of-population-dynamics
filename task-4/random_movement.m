function [dy, dx] = random_movement()
% RANDOM_MOVEMENT

roll = rand;

if roll < 0.25
    % North
    dy = 1;
    dx = 0;
elseif roll < 0.5
    % South
    dy = -1;
    dx = 0;
elseif roll < 0.75
    % East
    dy = 0;
    dx = 1;
else
    % West
    dy = 0;
    dx = -1;
end

end

