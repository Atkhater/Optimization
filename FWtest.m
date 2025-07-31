clc;
clear;
close all;
% Define the coordinates of the cities as columns of a matrix
aj = [0, 87, 126, 53, 17, 66, 27, -29, -95, 140, 50; % x-coordinates
      0, 15, -64, -21, -68, -61, 73, 66, -13, 78, 75]; % y-coordinates

% Define the populations of the cities
populations = [151000, 660000, 78000, 653000, 418000, 1200000, 2700000, 74000, 1830000, 770000, 378000];

% Compute the weights proportional to the populations
wj = populations ./ sum(populations);

% Define a point at which the function is evaluated (e.g., the mean position of all cities)
x = [100;100];

% Call the FWobj function
f_value = FWobj(x, aj, wj);
% Display the computed objective function value
disp(['Objective function value at the point x: ', num2str(f_value)]);


% Define a test point x at which the function and gradient are evaluated
x_test = [27;73]; % Using the mean location of cities as a test point

% Now, test the FWgrad function to compute the gradient at x_test
grad = FWgrad(x_test, aj, wj);

% Display the results
disp('Objective function value at the test point x:');
disp(f_value);
disp('Gradient of the objective function at the test point x:');
disp(grad);

% Choose a search direction, here simply using the negative gradient for demonstration
searchDir = -grad;

% Define the parameters for the backtracking line search
alpha = 0.25;
beta = 0.1;

% Call the FWbtrack function to find an appropriate step size
s = FWbtrack(x_test, aj, wj, @FWobj, grad, searchDir, alpha, beta);

% Display the computed step size
disp('step size:');
disp(s);

% Define a tolerance for the convergence criterion
tol = 1e-6;

% Call the EuropeCenter function to solve the Fermat-Weber problem
[x_center, f_min] = EuropeCenter(aj, wj, tol);

% Display the results
disp('Coordinates of the center point (x):');
disp(x_center);
disp('Minimum objective function value:');
disp(f_min);
