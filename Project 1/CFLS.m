
%Aly Khater AMTH 370
%x = coordinates
%r = radius
%f_min = minimum objective value function.

%aj_mn = coordinates of the node
%v_wj = weight vector

function[x, r, f_min] = CLFS(aj_mn, v_wj)
    %Equations for A, b, x from notes
    %A = (2*aj*sqrt(w)),*-sqrt(w)
    %b = (norm(a)^2*sqrt(w))
    %x = (A^T*a)^-1(A^T*b) (normal equation)
    wj_rooted = transpose(sqrt(v_wj)); 
    %transposes for matrix multiplication
    A = cat(2, 2*wj_rooted.*transpose(aj_mn),-wj_rooted);
    b_fac = transpose(vecnorm(aj_mn).^2);
    %vector b
    b = wj_rooted .* b_fac;
    %normal equation for x
    x = inv(transpose(A)*A)*transpose(A)*b;
    func = A*x - b;
    %quadratic function min ||Ax-b||^2 or (Ax-b)^T*(Ax-b)
    quad_func = transpose(func)*func;
    f_min = quad_func;
    %store last value of x into temporary variable for radius later on
    temp_r = x(end);
    x = x(1:end-1);
    r = sqrt(power(norm(x),2)-temp_r); %solve for radius
end
