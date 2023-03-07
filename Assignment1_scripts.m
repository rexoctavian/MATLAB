% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your code for exercise 1, 5 and 6



%% ================== Exercise 1 ==================

% INSERT YOUR CODE FOR EXERCISE 1 HERE

% Load in data from salesMetformin.dat

data = load('salesMetformin.dat');

% Assign row 1 as X values

X = data(1,:);

% Assign row 2 as Y values

Y = data(2,:);

% Set new figure

figure();

% Plot line graph as red *s with linewidth set to 3

line(X,Y,'color', 'red', 'LineWidth', 3, 'marker', '*');

% Set x axis to 'Period' with a fontsize of 22

xlabel('Period', 'fontsize', 22);

% Set y axis to 'Sales in billions (£)' with a fontsize of 22

ylabel('Sales in billions (£)', 'fontsize', 22);

% Setting the grid on to show a grid on the figure
% Setting hold off to allow for a new figure to be made

grid on
hold off

%% ================== Exercise 5 ==================

% INSERT YOUR CODE FOR EXERCISE 5 HERE


% Generate a uniformly distributed vector X with 1000 values, where xmin=30 and xmax=40

uniformly_distributed_1000_points_X = 30 + (40-30)*rand(1000,1);

% Generate a uniformly distributed vector Y with 1000 values, where ymin=10 and ymax=20

uniformly_distributed_1000_points_Y = 10 + (20-10)*rand(1000,1);

% Setting new figure

figure();

% Plotting the above X and Y vectors as blue os with a linewidth of 3

plot(uniformly_distributed_1000_points_X , uniformly_distributed_1000_points_Y , 'bo', 'LineWidth', 3);

% Setting hold on to allow for more points to be added to the figure
% Setting the grid on to show a grid on the figure

hold on;
grid on;

% Generate a normally distributed vector X with 1000 values, with mean of 20 and unit variance

normally_distributed_1000_points_X = randn(1000, 1) + 20;

% Generate a normally distributed vector Y with 1000 values, with mean of 35 and unit variance

normally_distributed_1000_points_Y = randn(1000, 1) + 35;

% Plotting the above X and Y vectors as red stars with a linewidth of 2

plot(normally_distributed_1000_points_X, normally_distributed_1000_points_Y , 'r*', 'LineWidth', 2);

% Setting the axis for the plot

axis([0 50 0 50]);

% Setting axis ticks and their respective steps

xticks(0:10:50);
yticks(0:5:50);

% Setting axis labels

xlabel('x axis');
ylabel('y axis');

% Setting the legend for the graph to display which points are uniformily and which are normaly distributed

legend('Uniform Distribution', 'Normal Disribution');

% Setting the hold off to allow for creation of a new figure

hold off;

%% ================== Exercise 6 ==================

% INSERT YOUR CODE FOR EXERCISE 6 HERE

% Generate 20000 points, in 3 dimensions, uniformly distributed in the interval (0,1)

uniform_20000_3d = rand([20000, 3]);

% Split this 3d matrix to allow for manipulation

x = uniform_20000_3d(:,1);
y = uniform_20000_3d(:,2);
z = uniform_20000_3d(:,3);

% Extract those points for which at least one of the 3 dimensions is bigger than 0.9

x_greaterthan = x(x > 0.9 | y > 0.9 | z > 0.9);
y_greaterthan = y(x > 0.9 | y > 0.9 | z > 0.9);
z_greaterthan = z(x > 0.9 | y > 0.9 | z > 0.9);

% Setting new figure

figure();

% Plotting a 3d space with the points selected above as blue *s

plot3(x_greaterthan, y_greaterthan, z_greaterthan, 'b*')

% Setting hold on to allow for more points to be added to the figure
% Setting the grid on to show a grid on the figure

hold on
grid on

% Extract those points for which both conditions are met:
% 1 - At least one of the 3 dimensions is bigger than 0.4
% 2 - All the dimensions are smaller than 0.5

x_both_conditions_met = x((x > 0.4 | y > 0.4 | z > 0.4) & (x < 0.5 & y < 0.5 & z < 0.5));
y_both_conditions_met = y((x > 0.4 | y > 0.4 | z > 0.4) & (x < 0.5 & y < 0.5 & z < 0.5));
z_both_conditions_met = z((x > 0.4 | y > 0.4 | z > 0.4) & (x < 0.5 & y < 0.5 & z < 0.5));

% Adding these points to the previous 3d space as red *s

plot3(x_both_conditions_met, y_both_conditions_met, z_both_conditions_met, 'r*')

% Setting axis ticks and their respective steps

xticks(0:0.2:0.8)
yticks(0:0.2:0.8)
zticks(0.1:0.1:0.9)

% Setting axis labels

xlabel('x axis')
ylabel('y axis')
zlabel('z axis')