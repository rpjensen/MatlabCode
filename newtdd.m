%% function coeff = newtdd(xdata,ydata)
%
% Returns the Newton's Divided Difference coefficients computed from data.
%
% Inputs: 
%    xData, yData
%    Arrays of x and y coordinates of your interpolation nodes.
%
% Output: 
%    coeff
%    The Newton's Divided Difference coefficients: f[x1], f[x1 x2], ...

function coeff = newtdd(xdata,ydata)

numpoints = length(xdata);      % Determine number of data points (nodes)

for j = 1:numpoints
    ddiff(j,1) = ydata(j);      % First divided differences are y values
end
for i = 2:numpoints             % Fill in the rest of the "table"
    for j = 1:numpoints+1-i
        ddiff(j,i) = (ddiff(j+1,i-1)-ddiff(j,i-1))/(xdata(j+i-1)-xdata(j));
    end
end
for i = 1:numpoints             % The top row gives us the coefficients
    coeff(i) = ddiff(1,i);
end