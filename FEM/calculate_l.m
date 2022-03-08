% Gaussian quadrature method
function l = calculate_l(v, n)
    v = v - 1;
    h = 2/n;
    factor_1 = h * (1/sqrt(3)) + v * h;
    factor_2 = h * (-1/sqrt(3)) + v * h;
    l = h * (sin(factor_1) * base_function(v, n, factor_1)  +...
             sin(factor_2) * base_function(v, n, factor_2));
end