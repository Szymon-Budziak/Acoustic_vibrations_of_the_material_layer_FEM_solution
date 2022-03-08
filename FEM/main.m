function main
    n = input("Enter the number of elements: ");
    b_matrix = zeros(n+1, n+1);
    % Dirichlet boundary condition
    b_matrix(1, 1) = 1;
    l_matrix = zeros(n+1, 1);
    for i=2:n+1
        % diagonal of B matrix
        b_matrix(i, i) = calculate_b(i, i, n);
        % lower diagonal of B matrix
        if i < n+1
            b_matrix(i, i+1) = calculate_b(i, i+1, n);
        end
        % upper diagonal of B matrix
        if i > 2
            b_matrix(i, i-1) = calculate_b(i, i-1, n);
        end
        % L matrix
        l_matrix(i, 1) = calculate_l(i, n);
    end
    % solution of linear equations
    result = linsolve(b_matrix, l_matrix);
    disp(result);
    h = 2/n;
    x = 0: h: 2;
    y = zeros(1, n+1);
    % plot of the result, for each x we increment y by result*base_function
    for i=0:length(x)-1
        for j=0:length(result)-1
            y(i+1) = y(i+1) + result(j+1) * base_function(j, n, x(i+1));
        end
    end
    plot(x, y);
    det(b_matrix)
end