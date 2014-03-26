%% function y = newtpoly(degree,coeff,x,xNodes)
%
% Returns the Newton's Divided difference interpolating polynomial 
% to the inputs.
%
% Inputs: 
%    degree
%    The degree of the polynomial you will return.
%    coeff
%    The coefficients of this polynomial (from Newton's Divided Difference).
%    x
%    The domain at which you are computing the polynomial.
%    xNodes
%    Your interpolation nodes.
%
% Output: y = c1 + c2(x-x1) + c3(x-x1)(x-x2) + ...

function y = nest(degree,coeff,x,xNodes)

y = zeros(size(x));             % Initialize our output, y

for j = 1:degree+1              % For each term in the polynomial
    xProd = 1;                  % Compute (x-x1)(x-x2)... product
    for k = 1:j-1
        xProd = xProd.*(x - xNodes(k));
    end
    y = y + coeff(j)*xProd;     % Multiply by coefficient and add to rest
end