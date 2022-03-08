function derivative = deriv(i, n, x)
    h = 2/n;
    if(x >= h*(i-1) && x < h*i)
        derivative = 1/h;
    elseif (x >= h*i && x < h*(i+1))
        derivative = -1/h;
    else
        derivative = 0;
    end
end