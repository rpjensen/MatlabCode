function [df, err] = fivePtCenter(f, x, h)
% Approximates the derivative of f(x) with a step size of h
%Returns the evaluated derivative and the order of the approx. error O(h^4)

df = (8*f(x + h/2) - 8*f(x - h/2) - f(x + h) + f(x-h)) / (6 * h);
err = h^4;

end
