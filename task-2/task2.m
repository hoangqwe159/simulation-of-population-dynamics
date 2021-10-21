%% lhs_impl testing

% plotting a LHS sampling for a 5x5 grid on [0,1]x[0,1]
figure
hold on 

%plotting vertical and horizontal lines for the grid
plot([0 1],[0/5 0/5],'k')
plot([0 1],[1/5 1/5],'k')
plot([0 1],[2/5 2/5],'k')
plot([0 1],[3/5 3/5],'k')
plot([0 1],[4/5 4/5],'k')
plot([0 1],[5/5 5/5],'k')
plot([0/5 0/5],[0 1],'k')
plot([1/5 1/5],[0 1],'k')
plot([2/5 2/5],[0 1],'k')
plot([3/5 3/5],[0 1],'k')
plot([4/5 4/5],[0 1],'k')
plot([5/5 5/5],[0 1],'k')

X = lhs_impl(5, 2, [0 1]);
scatter(X(:,1),X(:,2),50,'filled');

figure
hold on
X = lhs_impl(10,2, [0 1]);
grid on
scatter(X(:,1),X(:,2),50,'filled')

figure
hold on
X = lhs_impl(10,3, [0 1]);
grid on
scatter3(X(:,1),X(:,2),X(:,3),50,'filled')

%% 3D latin hypercube sampling

n = 50;
k1 = 1;
k2 = 2;
x1_0 = 1;
x2_0 = 1;
x0 = [x1_0, x2_0];
tol = 0.25;
time = [0 20];

samples = [];
for i = 1:100
    X = lhs_impl(n,3,[0 50]);
    valid = lhs_system(tol, time, x0, k1, k2, X);
    samples = [samples; [X valid]];
end

% both
figure
hold on
grid on

successful = find(samples(:,4) == 1);
unsuccessful = find(samples(:,4) == 0);

x1 = samples(successful,1);
y1 = samples(successful,2);
z1 = samples(successful,3);

x0 = samples(unsuccessful,1);
y0 = samples(unsuccessful,2);
z0 = samples(unsuccessful,3);

scatter3(x1,y1,z1,50,'filled', 'blue');
hold on

scatter3(x0,y0,z0,50,'filled', 'red');
hold on

legend('successful', 'unsuccessful');
xlabel('k3');
ylabel('k4');
zlabel('k5');

% successful
figure
hold on
grid on

scatter3(x1,y1,z1,50,'filled','blue');
hold on

legend('successful');
xlabel('k3');
ylabel('k4');
zlabel('k5');

% unsuccessful
figure
hold on
grid on

scatter3(x0,y0,z0,50,'filled','red');
hold on

legend('unsuccessful');
xlabel('k3');
ylabel('k4');
zlabel('k5');




