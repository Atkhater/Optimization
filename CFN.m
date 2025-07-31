%Aly Khater AMTH 370

function [x,r,f_min] = CFN(aj_mn,v_wj,tol)
    %Input values below. 
    alpha = 0.01;
    beta = 0.5;
    x = mean(aj_mn,2);%E[X],Initilializes x to be somewhere inside the nodes.
    r = std(aj_mn(:));%Sigma, Initilizes r to be std deviation of the nodes.
    x_m1 = [x;r];

    terminationcondition = true; %ensures while loop runs once

    while terminationcondition
        %Gets the gradient
        grad = CFgrad(x_m1, aj_mn, v_wj);
        %Gets hessian
        H = CFHess(x_m1, aj_mn, v_wj);

        % checks hess if P.D.
        if all(eig(H) > 0)
            % hessian is p.d, perform Newton step
            d = -H \ grad; % Newton direction
        else
            % Hessian is not p.d, switch to Steepest Descent step
            d = -grad; % Steepest Descent direction
        end

        %Gets optimal step size
        s = CFbtrack(x_m1, aj_mn, v_wj, @CFobj, grad, d, alpha, beta);

        x_m1_new = x_m1 + s*d;

        terminationcondition = norm(x_m1_new - x_m1)/norm(x_m1_new) > tol;

        x_m1 = x_m1_new;

    end

    %outputs
    x = x_m1(1:end-1);
    r = x_m1(end);
    f_min = CFobj(x_m1, aj_mn, v_wj);