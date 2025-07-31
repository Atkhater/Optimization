%Aly Khater AMTH 370
%x = vector in Rm
%aj_mn = 2xn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.
%output = gradient

% gradient is sum(wj * (x-aj)/norm(x-aj)

function grad = FWgrad(x,aj_mn,v_wj)
    diff = x-aj_mn;
    epsilon = 1e-8;
    norm_cf = vecnorm(diff)+epsilon;%calculates norm
    weighted_norm_cf = diff ./ norm_cf;
    inner = weighted_norm_cf .* v_wj; %inner
    grad = sum(inner,2); %output
end