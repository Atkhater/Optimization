%Aly Khater AMTH 370
%x = coordinates
%r = radius
%f_min = minimum objective value function.

%aj_mn = coordinates of the node
%v_wj = weight vector
%tol = tolerance

function [x_out,f_min] = SLSD(aj_mn,v_wj,d_j,tol)
    %Input values below. 
    alpha = 0.01;
    beta = 0.5;
    x = mean(aj_mn,2);%E[X],Initilializes x to be somewhere inside the nodes.
    f_curr = SLObj(x, aj_mn,v_wj,d_j); %f(x)

    terminationcondition = true; %ensures while loop runs once

    while terminationcondition
        %Gets the gradient
        gradient = SLgrad(x, aj_mn, v_wj, d_j);
        %descent direction
        d = -gradient;
        %Gets optimal step size
        s = SLbtrack(x, aj_mn, v_wj, d_j, @SLObj, gradient, d, alpha, beta);
        %x_k+1
        x_new = x + s*d;
        %Boolean to check if terminationcondition is still true
        terminationcondition = vecnorm(x_new - x)/norm(x_new) > tol;
        %updates x
        x = x_new;
        f_curr = SLObj(x, aj_mn, v_wj, d_j);
    end
    
    %outputs
    x_out = x;
    f_min = f_curr;

end