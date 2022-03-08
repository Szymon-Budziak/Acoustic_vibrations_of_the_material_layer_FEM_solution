% Gaussian quadrature method
function b = calculate_b(u, v, n)
    h = 2/n;
    u = u-1;
    v = v-1;
    b = -base_function(u, n, 2) * base_function(v, n, 2);
    % upper diagonal
    if u == v-1
        factor_1 = h/2 * (1/sqrt(3)) + (2*u*h+h)/2;
        factor_2 = h/2 * (-1/sqrt(3)) + (2*u*h+h)/2;
        b = b + h/2 * (deriv(u, n, factor_1) * deriv(v, n, factor_1) + ...
                       deriv(u, n, factor_2) * deriv(v, n, factor_2));
        b = b - h/2 * (base_function(u, n, factor_1) * base_function(v, n, factor_1) + ...
                       base_function(u, n, factor_2) * base_function(v, n, factor_2));
    % lower diagonal    
    elseif u == v+1
        factor_1 = h/2 * (1/sqrt(3)) + (2*u*h-h)/2;
        factor_2 = h/2 * (-1/sqrt(3)) + (2*u*h-h)/2;
        b = b + h/2 * (deriv(u, n, factor_1) * deriv(v, n, factor_1) + ...
                       deriv(u, n, factor_2) * deriv(v, n, factor_2));
        b = b - h/2 * (base_function(u, n, factor_1) * base_function(v, n, factor_1) + ...
                       base_function(u, n, factor_2) * base_function(v, n, factor_2));
    % main diagonal
    elseif u == n
        factor_1 = h/2 * (1/sqrt(3)) + (2*u*h-h)/2;
        factor_2 = h/2 * (-1/sqrt(3)) + (2*u*h-h)/2;
        b = b + h/2 * (deriv(u, n, factor_1)^2 + deriv(u, n, factor_2)^2);
        b = b - h/2 * (base_function(u, n, factor_1)^2 + base_function(u, n, factor_2)^2);
    else
        factor_1 = h * (1/sqrt(3)) + u*h;
        factor_2 = h * (-1/sqrt(3)) + u*h;
        b = b + h * (deriv(u, n, factor_1)^2 + deriv(u, n, factor_2)^2);
        b = b - h * (base_function(u, n, factor_1)^2 + base_function(u, n, factor_2)^2);
    end
end