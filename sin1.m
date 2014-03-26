%% function y = sin1(x)
%
% Returns an interpolating polynomial approximation for sin(x) computed
% using equally spaced nodes
% Input:  x (your desired domain)
% Output: y (your sin(x) approximation)
%
% Note: Changing the value of numPoints inside the function will change the
% number of interpolation points used for the approximation (and thus, the
% degree of the polynomial).

function y = sin1(x)

% This is where we can change the number of interpolation points
% we wish to use to find our polynomial
numPoints = 4;

% Compute the equally spaced interpolation points
xNodes = linspace(0,pi/2,numPoints);
yNodes = sin(xNodes);

% Compute the Newton's Divided Difference coefficients
coeff = newtdd(xNodes,yNodes); 

% Move our angle to the fundamental domain (i.e. find the appropriate
% reference angle), and determine whether our answer is positive or
% negative. (This is calling a separate function!)
[refAngle,theSign] = findSinDomain(x);

% Put it all together by computing the interpolating polynomial.
y = theSign*newtpoly(numPoints-1,coeff,refAngle,xNodes);