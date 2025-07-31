%Aly Khater AMTH 370
%x = coordinates
%r = radius
%f_min = minimum objective value function.

%aj_mn = coordinates of the node
%v_wj = weight vector
%tol = tolerance

function [x,r,f_min] = CFSD(aj_mn,v_wj,tol)
    %Input values below. 
    alpha = 0.01;
    beta = 0.5;
    x = mean(aj_mn,2);%E[X],Initilializes x to be somewhere inside the nodes.
    r = std(aj_mn(:));%Sigma, Initilizes r to be std deviation of the nodes.
    x_m1 = [x;r];

    f_curr = CFobj(x_m1, aj_mn,v_wj); %f(x)

    terminationcondition = true; %ensures while loop runs once

    while terminationcondition
        %Gets the gradient
        gradient = CFgrad(x_m1, aj_mn, v_wj);
        %descent direction
        d = -gradient;
        %Gets optimal step size
        s = CFbtrack(x_m1, aj_mn, v_wj, @CFobj, gradient, d, alpha, beta);
        %x_k+1
        x_m1_new = x_m1 + s*d;
        %Boolean to check if terminationcondition is still true
        terminationcondition = vecnorm(x_m1_new - x_m1)/norm(x_m1_new) > tol;
        %updates x
        x_m1 = x_m1_new;
        f_curr = CFobj(x_m1, aj_mn, v_wj);
    end
    
    %outputs
    x = x_m1(1:end-1);
    r = x_m1(end);
    f_min = f_curr;

end