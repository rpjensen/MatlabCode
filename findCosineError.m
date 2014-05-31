function [n] = findCosineError(x , tol)
conditionNotMet = true;
n = 2;
while (conditionNotMet)
    diff = pi/(2*n);
    nodes = 0:diff:pi/2;
    errorMax = 1;
    for iter = 1:n+1
        errorMax = errorMax * (x - nodes(iter));
    end
    errorMax = errorMax / factorial(n);
    if abs(errorMax) < tol
        conditionNotMet = false;
    end
    n = n + 1;
end

