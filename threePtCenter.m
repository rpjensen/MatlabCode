function [df, err] = threePtCenter(f, x, h)
% Approximates the derivative of f(x) with a step size of h
%Returns the evaluated derivative and the order of the approx. error O(h^2)

df = (f(x + h) - f(x - h)) / (2*h);
err = h^2;

end
