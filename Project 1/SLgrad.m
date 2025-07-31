%x = vector in Rm
%aj_mn = mxn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.
%d_j = distance

%output = gradient
%where gradient = (d/dx)
%gradient first element is 4sum(w(||x-aj||^2-d^2)(x-aj)

function gradient = SLgrad(x, aj_mn, v_wj, d_j)
    diff = (x - aj_mn); %difference
    norm_cf = vecnorm(diff); %calculates norm ||x-aj||
    inner = v_wj.*(norm_cf.^2-d_j.^2); %calculates inner of the sum for both equations
    %N = diff/norm_cf no need since its distance, not radius.
    grad_dx = sum(inner.*diff,2); %gradient w.r.t x
    gradient = 4*grad_dx; %returns gradient
end

