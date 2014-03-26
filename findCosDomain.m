%% function [refAngle,theSign] = findCosDomain(oldAngle)
%
% Maps an angle to the functional domain, [0,pi/2], for evaluating sine
% Input:
%    oldAngle
%    The angle at which you are evaluating the cosine function.
% Outputs:
%    refAngle
%    This is the reference angle in [0,pi/2] for which
%      |cos(oldAngle)| = |cos(refAngle)|
%    theSign
%    Returns the value 1 or -1 if cos(oldAngle) is pos or neg, respectively.
function [refAngle,theSign] = findCosDomain(oldAngle)

% First, we initialize the sign to be positive, 
% and determine our angle mod 2*pi
theSign = 1;              
refAngle = mod(oldAngle,2*pi); 

% If this angle is still greater than pi, we know sin will be negative.
% Subtract from 2*pi, since we our reference angle must be less than pi
if refAngle > pi
    refAngle = 2*pi - refAngle;
    theSign = -1;
end

% Reference angles are always between 0 and pi/2, so we correct for that.
if refAngle > pi/2
    refAngle = pi - refAngle;
end

