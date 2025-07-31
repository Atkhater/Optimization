%output is step size
%Aly Khater AMTH 370
%x = current iterate
%aj_mn = coordinates of the node
%v_wj = weight vector
%dj = distance
%f = objective function
%g = gradient
%d = search direction
%alpha,beta = parameters.

function s = SLbtrack(x, aj_mn, v_wj, d_j, f, g, d, alpha, beta)
    s = 1; %initilize with 1 given in the instructions
    
    f_curr = f(x, aj_mn, v_wj, d_j); %f(x)

    x_new = x+s*d; %x_k+1 = x + t*d

    f_new = f(x_new, aj_mn, v_wj, d_j); %f(x_k+1) = f(x+td)
    
    %From notes in class, f(x+td) > f(x)+alpha*t*grad^T*d\
    
    %test displays
    %disp(['Value to beat: ', num2str(f_curr), '  Current Iteration Value: ', num2str(f_new)]); %comment out later
    g_T = transpose(g);
    while f_new > f_curr + alpha * s * g_T*d
        s = s * beta; %beta < 1. Reduces step size
        sd = s .*d;
        x_new = x + sd; %next step
        f_new = f(x_new, aj_mn, v_wj, d_j); %next function
        %test displays
        %disp(['Value to beat: ', num2str(f_curr), '  Current Iteration Value: ', num2str(f_new)]); %comment out later
    end
end