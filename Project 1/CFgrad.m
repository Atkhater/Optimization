%Aly Khater AMTH 370
%v_m1 = vector in Rm+1
%aj_mn = mxn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.

%output = gradient
%where gradient = (d/dx ; d/dr)
%gradient first element is sum(2*wj*||x-aj||-r)(normalize(||x-aj||)
%gradient second element is sum(-2*wj*(||x-aj||-r)


function gradient = CFgrad(v_m1, aj_mn, v_wj)
    r = v_m1(end); %radius
    x = v_m1(1:end-1); %vector w/o radius
    norm_cf = vecnorm(x - aj_mn); %calculates norm ||x-aj||
    inner = 2*v_wj.*(norm_cf-r); %calculates inner of the sum for both equations
    N = (x-aj_mn)/norm_cf; %normalized vector for d/dx
    grad_dx = sum(inner.*N,2); %gradient w.r.t x
    grad_dr = sum(-inner); %gradient w.r.t r
    gradient = [grad_dx;grad_dr]; %returns concat gradient
end