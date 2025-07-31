%Aly Khater AMTH 370
%v_m1 = vector in Rm+1
%aj_mn = mxn matrix, coordinates of nodes aj 
%v_wj = vector of the weights.

%output = hessian
%where gradient = (d/dx ; d/dr)
%gradient first element is sum(2*wj*||x-aj||-r)(normalize(||x-aj||)
%gradient second element is sum(-2*wj*(||x-aj||-r)

%hessian = (d2/dx2 d2/dxdr ; d2/dxdr d2/dr2) for 2x2

function H = CFHess(v_m1, aj_mn, v_wj)
    r = v_m1(end); %radius
    x = v_m1(1:end-1); %vector w/o radius
    
    m = length(x); %
    H = zeros(m + 1, m + 1); %intialize hessian size
    eps = 1e-8; %avoid divide by 0
    %second-order derivatives
    for j = 1:size(aj_mn, 2) % For each node
        aj = aj_mn(:, j); % Current node
        wj = v_wj(j); % Weight for the current node
        norm_cf = vecnorm(x - aj)+eps;%calculates norm ||x-aj||
        
        % w.r.t. x
        for k = 1:m
            for l = 1:m
                if k == l %Diagonal d^2/dx^2
                    H(k, l) = H(k, l) + wj * (1 - (r / norm_cf)) * (1 / norm_cf) * (x(k) - aj(k))^2;
                else %Not diagonal D^2,dxdxk
                    H(k, l) = H(k, l) + wj * (1 - (r / norm_cf)) * (1 / norm_cf) * (x(k) - aj(k)) * (x(l) - aj(l));
                end
            end
        end
        
        % w.r.t. x and r
        for k = 1:m
            H(k, m+1) = H(k, m+1) + wj * (-(x(k) - aj(k)) / norm_cf); %d^2/dxd4
            H(m+1, k) = H(k, m+1); %symmetrical matrix
        end
        
        % dm/drm
        H(m+1, m+1) = H(m+1, m+1) + wj * 2;
    end
end