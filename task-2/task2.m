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

%% 3d latin hypercube sampling

k1 = 1;
k2 = 2;
x1_0 = 1;
x2_0 = 1;
tol = 0;
time = 20;

X = lhs_impl(10,3,[0 50]);

% TODO: draw grid lines

figure
hold on
grid on
scatter3(X(:,1),X(:,2),X(:,3),50,'filled')