clc;
clear;
close all;
% Define the sensor node locations (columns of the matrix)
aj_mn = [1, 3, 4; 2, 0, 5]; % Example in 2D space for 3 sensors

% Define the vector of approximate distances from the sensors to the source
d_j = [2.5, 3.0, 1.5]; % Just an example, these should be based on actual measurements or estimates

% Define the vector of weights for each sensor node
v_wj = [0.3, 0.4, 0.3]; % Weights should sum up to 1, and this is just an example

% Define an initial guess for the source location
x_guess = [0; 0]; % This is a guess and should be adjusted based on your problem context

% Test the SLObj function with the initial guess
f_value = SLObj(x_guess, aj_mn, v_wj, d_j);

% Display the result
disp(['Objective function value at the initial guess: ', num2str(f_value)]);

% Test the SLGrad function with the same initial guess and other inputs
gradient = SLgrad(x_guess, aj_mn, v_wj, d_j);

% Display the gradient
disp('Gradient at the initial guess:');
disp(gradient);

% Define alpha and beta parameters for the backtracking line search
alpha = 0.01;
beta = 0.5;

% Objective function handle (assuming SLObj.m is implemented correctly)
f = @SLObj;

% Define a search direction (typically the negative of the gradient)
search_direction = -gradient;

% Call the CFbtrack function to determine the appropriate step size
step_size = SLbtrack(x_guess, aj_mn, v_wj, d_j, f, gradient, search_direction, alpha, beta);

% Display the calculated step size
disp(['Calculated step size: ', num2str(step_size)]);

% Define a tolerance for the convergence criterion in Steepest Descent
tol = 1e-5;

% Call the SLSD function to find the optimized source location and minimum objective function value
[x_opt, f_min] = SLSD(aj_mn, v_wj, d_j, tol);

% Display the results
disp('Optimized source location:');
disp(x_opt);
disp(['Minimum objective function value: ', num2str(f_min)]);