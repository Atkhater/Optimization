%Aly Khater AMTH 370
%x = vector in Rm
%aj_mn = mxn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.
%d_j = distances
%min(sum(v_wj(norm(x-aj)-d^2)^2

function f = SLObj(x, aj_mn, v_wj, d_j)
    norm_cf = (vecnorm(x - aj_mn)).^2; %calculates norm
    weighted_cf = sqrt(v_wj); %Applies the weighted term
    combined = (weighted_cf.*norm_cf-d_j.^2).^2;
    f = sum(combined);
end
