function [df, err] = fivePointForward(f, x, h)
% Approximates the derivative of f(x) with a step size of h
%Returns the evaluated derivative and the order of the approx. error O(h^2)

df = (32*f(x + h/2) - 7*f(x + h) + f(x + 2*h) - 21*f(x)) / (6*h);
err = h^2;%When I worked this out on paper I didn't even get that the error
%went down at all due to the extrapolation.  I don't know if I did it wrong
%but I would be down to show you my calculation because I couldn't quite 
%figure out why it didn't go down at lease one order O(h^2) -> O(h^3)

end

