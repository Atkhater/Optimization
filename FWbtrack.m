%output is step size
%Aly Khater AMTH 370
%v_m1 = current iterate
%aj_mn = coordinates of the nodeT
%v_wj = weight vector
%f = objective function
%g = gradient
%d = search direction
%alpha,beta = parameters.

function s = FWbtrack(x, aj_mn, v_wj, f, g, d, alpha, beta)
    s = 1; %initilize with 1 given in the instructions
    f_curr = f(x, aj_mn, v_wj); %f(x)
    x_new = x+s*d; %x_k+1 = x + t*d
    f_new = f(x_new, aj_mn, v_wj); %f(x_k+1) = f(x+td)
    %f_test = f_curr + alpha * s * dot(g,d);
    %dota = dot(g,d);
    g_T = transpose(g);
    while f_new > f_curr + alpha * s * g_T*d
        s = s * beta; %beta < 1. Reduces step size
        x_new = x + s.*d; %next step
        f_new = f(x_new, aj_mn, v_wj); %next function
        %disp(['Value to beat: ', num2str(f_curr), '  Current Iteration Value: ', num2str(f_new)]); %comment out later
    end
end
