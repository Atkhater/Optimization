%Aly Khater AMTH 370

function [x_out, f_min] = EuropeCenter(aj_mn, v_wj, tol)
    %Input values below. 
    alpha = 0.01;
    beta = 0.5;
    x = [1e2;1e2];%E[X],Initilializes x to be somewhere inside the nodes
    f_curr = FWobj(x, aj_mn,v_wj); %f(x)

    terminationcondition = true; %ensures while loop runs once
    
    while terminationcondition
        %Gets the gradient
        grad = FWgrad(x, aj_mn, v_wj);

        %disp('Gradient of the objective function at the test point x:');
        %disp(grad);

        d = -grad; %search direction
        %step size
        s = FWbtrack(x, aj_mn, v_wj, @FWobj, grad, d, alpha, beta);

        
        x_new = x + s*d;
        %update termination condition
        tc = vecnorm(x_new - x)/vecnorm(x_new);
        terminationcondition = norm(x_new - x)/norm(x_new) > tol;

        x = x_new;
        f_curr = FWobj(x, aj_mn, v_wj);
    end

    x_out = x;
    f_min = f_curr;
end

