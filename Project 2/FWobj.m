%Aly Khater AMTH 370
%x = vector in Rm
%aj_mn = 2xn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.

%sum(wj*vecnorm(x-aj))
function f = FWobj(x,aj_mn,v_wj)
    diff = x - aj_mn;
    norm_cf = (vecnorm(diff)); %calculates norm
    xj_wj =  v_wj .* norm_cf;
    f = sum(xj_wj);
end

