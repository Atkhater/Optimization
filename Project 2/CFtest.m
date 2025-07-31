clc;
close;
clear all;
% Define a simple set of nodes (aj) and weights (wj)
aj_mn = [1, 2, 3; 4, 5, 6]; % Example nodes as columns of a 2x3 matrix
v_wj = [0.3, 0.3, 0.4]; % Example weights
tol = 1e-5;
% Define a starting point for the center (x) and radius (r) of the circle
x = [2; 5]; % Center of the circle
r = 1; % Radius of the circle
v_m1 = [x; r]; % Vector for CFobj function

% Call the CFobj function
function_value = CFobj(v_m1, aj_mn, v_wj);
gradient = CFgrad(v_m1, aj_mn, v_wj);

d = -gradient;
alpha = .01;
beta = 0.5;

obj_func = @CFobj;
step_size = CFbtrack(v_m1, aj_mn, v_wj, obj_func, gradient, d, alpha, beta);
[x,r,f_min] = CFSD(aj_mn, v_wj, tol);

[x_ls,r_ls,f_min_ls] = CFLS(aj_mn, v_wj)
% Display the result
disp(['CFobj Function value: ', num2str(function_value)]);
disp('CFgrad Function value: ') 
disp(gradient);
disp(['Optimal step size: ', num2str(step_size)]);
disp(['Optimized center (x): ', mat2str(x)]);
disp(['Optimized radius (r): ', num2str(r)]);
disp(['Minimum objective function value: ', num2str(f_min)]);
disp('Least Squares Optimization Results:');
disp(['Optimized center (x): ', mat2str(x_ls)]);
disp(['Optimized radius (r): ', num2str(r_ls)]);
disp('Minimum objective function value: ');
disp(f_min_ls)

