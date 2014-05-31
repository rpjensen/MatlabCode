function [df, err] = threePtForward(f, x, h)
% Approximates the derivative of f(x) with a step size of h
%Returns the evaluated derivative and the order of the approx. error O(h^2)

df = (4*f(x + h) - f(x + 2*h) - 3*f(x)) / (2*h);
err = h^2;

end

