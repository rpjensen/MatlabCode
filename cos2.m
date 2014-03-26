%% function y = cos2(x)
%
% Returns an interpolating polynomial approximation for cos(x) computed
% using Chebyshev nodes
% Input:  x (your desired domain)
% Output: y (your cos(x) approximation)
%
% Note: Changing the value of numPoints inside the function will change the
% number of interpolation points used for the approximation (and thus, the
% degree of the polynomial).
function y = cos2(x)

% This is where we can change the number of interpolation points
% we wish to use to find our polynomial
numPoints = 4;

% Compute the Chebyshev interpolation points
xNodes = pi/4*(1 + cos((1:2:2*numPoints-1)*pi/(2*numPoints)));
yNodes = cos(xNodes);

% Compute the Newton's Divided Difference coefficients
coeff = newtdd(xNodes,yNodes); 

% Move our angle to the fundamental domain (i.e. find the appropriate
% reference angle), and determine whether our answer is positive or
% negative.
[refAngle,theSign] = findCosDomain(x);

% Put it all together by computing the interpolating polynomial.
y = theSign*newtpoly(numPoints-1,coeff,refAngle,xNodes);

