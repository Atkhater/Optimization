%Aly Khater AMTH 370
%v_m1 = vector in Rm+1
%aj_mn = mxn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.

%output = minimization of first version
function f = CFobj(v_m1, aj_mn, v_wj)
    r = v_m1(end); %radius
    x = v_m1(1:end-1); %vector w/o radius
    norm_cf = vecnorm(x - aj_mn); %calculates norm
    power_cf = power(norm_cf-r,2); %calculates power
    weighted_cf = v_wj.*power_cf;%Applies the weighted term
    f = sum(weighted_cf); %returns objective function
end
