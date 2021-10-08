density = 0.2;
[domain, food, parasites] = initial_random_position(density);

iterations = 1000;
f1 = 46;
f2 = 0.02;
f3 = 65;
video = true;


[p, f] = stimulate(domain, parasites, food, iterations, parasite_max_age,food_death_threshold, food_creation_num, video);