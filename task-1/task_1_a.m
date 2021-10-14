%% r = 2, h = 0.01
y_s_50 = PopGrowthDelay(50,2,0.01,100,50,2000);
y_s_100 = PopGrowthDelay(50,2,0.01,100,100,2000);
y_s_150 = PopGrowthDelay(50,2,0.01,100,150,2000);
y_s_200 = PopGrowthDelay(50,2,0.01,100,200,2000);
y_s_250 = PopGrowthDelay(50,2,0.01,100,250,2000);
y_s_300 = PopGrowthDelay(50,2,0.01,100,300,2000);
y_s_350 = PopGrowthDelay(50,2,0.01,100,350,2000);
y_s_400 = PopGrowthDelay(50,2,0.01,100,400,2000);

h = zeros(8,1);

figure;
h(1)= plot(1:2001,y_s_50,"color", "#e6194b"); hold on;
h(2)= plot(1:2001,y_s_100,"color", "#3cb44b");
h(3)= plot(1:2001,y_s_150,"color", "#ffe119");
h(4)= plot(1:2001,y_s_200,"color", "#4363d8");
h(5)= plot(1:2001,y_s_250,"color", "#f58231");
h(6)= plot(1:2001,y_s_300,"color", "#911eb4");
h(7)= plot(1:2001,y_s_350,"color", "#42d4f4");
h(8)= plot(1:2001,y_s_400,"color", "#f032e6");

hold off;
legend(h,'s = 50','s = 100','s = 150','s = 200','s = 250','s = 300','s = 350','s = 400');
title("Population growth with r = 2, h = 0.01");
xlabel("Step");
ylabel("Population size");

%% r = 1/2, h = 0.05
y_s_50 = PopGrowthDelay(50,0.5,0.05,100,50,2000);
y_s_100 = PopGrowthDelay(50,0.5,0.05,100,100,2000);
y_s_150 = PopGrowthDelay(50,0.5,0.05,100,150,2000);
y_s_200 = PopGrowthDelay(50,0.5,0.05,100,200,2000);
y_s_250 = PopGrowthDelay(50,0.5,0.05,100,250,2000);
y_s_300 = PopGrowthDelay(50,0.5,0.05,100,300,2000);
y_s_350 = PopGrowthDelay(50,0.5,0.05,100,350,2000);
y_s_400 = PopGrowthDelay(50,0.5,0.05,100,400,2000);

h = zeros(8,1);

figure;
h(1)= plot(1:2001,y_s_50,"color", "#e6194b"); hold on;
h(2)= plot(1:2001,y_s_100,"color", "#3cb44b");
h(3)= plot(1:2001,y_s_150,"color", "#ffe119");
h(4)= plot(1:2001,y_s_200,"color", "#4363d8");
h(5)= plot(1:2001,y_s_250,"color", "#f58231");
h(6)= plot(1:2001,y_s_300,"color", "#911eb4");
h(7)= plot(1:2001,y_s_350,"color", "#42d4f4");
h(8)= plot(1:2001,y_s_400,"color", "#f032e6");

hold off;
legend(h,'s = 50','s = 100','s = 150','s = 200','s = 250','s = 300','s = 350','s = 400');
title("Population growth with r = 0.5, h = 0.05");
xlabel("Step");
ylabel("Population size");