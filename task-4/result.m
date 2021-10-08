
density = 0.2;
[domain, food, parasites] = initial_random_position(density);
steps = 1000;
parasite_max_age = 46;
food_creation_num = 65;
food_death_threshold = 0.02;


[p19, f19] = stimulate(domain, parasites, food, steps, parasite_max_age, food_creation_num, food_death_threshold);