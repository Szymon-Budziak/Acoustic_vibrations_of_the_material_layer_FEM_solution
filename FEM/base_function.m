function bf = base_function(i, n,x)
    h = 2/n;
    if (x >= h*(i-1) && x <= h*i)
        bf = (x - h*(i-1))/h;
    elseif (x >= h*i && x <= h*(i+1))
        bf = (h*(i+1) - x)/h;
    else
        bf=0;
    end
end

