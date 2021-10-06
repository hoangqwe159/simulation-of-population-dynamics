%% Case 19: Random F and P placements with Food created in random locations

make_video = true;
grid_width = 200;
density = 0.2;
[mask, parasites, food] = food_parasite_random_placement(density, grid_width);
steps = 1000;
parasite_max_age = 300;
food_creation_num = 30;
food_death_threshold = 0.50;
file_name = 'case19_simulation.avi';

[p19, f19] = simulation_case_2(mask, parasites, food, steps, grid_width, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video);
 
%% Results
% Food - Extinct (almost)
% But f3 food elements are always created at each iteration so they never
% go extinct

%% Case 20: Random F and P placements with Food created in random locations

make_video = true;
grid_width = 200;
density = 0.2;
[mask, parasites, food] = food_parasite_random_placement(density, grid_width);
steps = 1000;
parasite_max_age = 46;
food_creation_num = 65;
food_death_threshold = 0.02;
file_name = 'case20_simulation.avi';

[p20, f20] = simulation_case_2(mask, parasites, food, steps, grid_width, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video);

%% Results
% Equilibrium
t = 1:1:size(p20, 2);
figure;
plot(t, p20, 'r');
hold on
plot(t, f20, 'b');
legend('parasites', 'food');
title({'Random Food with Parasite Placement at 20%'; 'Random Food Reproduction'});

%% Case 21: Random F and P placements with Food created in neighbouring cells

make_video = true;
grid_width = 200;
density = 0.2;
[mask, parasites, food] = food_parasite_random_placement(density, grid_width);
steps = 250;
parasite_max_age = 20;
food_creation_num = 50;
food_death_threshold = 0.05;
file_name = 'case21_simulation.avi';

[p21, f21] = simulation_case_2(mask, parasites, food, steps, grid_width, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video);

%% Results
% Food lives
% Parasites dieout

%% Case 22: Localised F placements with Food reproduced in neighbouring cells
grid_width = 200;
density = 0.2;
[mask, parasites, food] = localised_food_random_parasite_placement(density, grid_width, 10);
steps = 500;
parasite_max_age = 35;
food_creation_num = 110;
food_death_threshold = 0.02;
file_name = 'case22_simulation.avi';

[p22, f22] = simulation_case_2(mask, parasites, food, steps, grid_width, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video);

%% Results
% Equilibrium
t = 1:1:size(p22, 2);
figure;
plot(t, p22, 'r');
hold on
plot(t, f22, 'b');
legend('parasites', 'food');
title({'Local Food with Parasite Placement at 20%'; 'Random Food Reproduction'});


%% Case 23: Localised F placements with Food reproduced in neighbouring cells
grid_width = 200;
density = 0.2;
[mask, parasites, food] = localised_food_random_parasite_placement(density, grid_width, 10);
steps = 500;
parasite_max_age = 10;
food_creation_num = 50;
food_death_threshold = 0.02;
file_name = 'case23_simulation.avi';

[p23, f23] = simulation_case_2(mask, parasites, food, steps, grid_width, parasite_max_age, food_creation_num, food_death_threshold, file_name, make_video);
%% Results
% Parasites become extinct
% Food lives on

