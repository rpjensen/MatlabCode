function y = polyinterp( xNodes,yNodes, x )
%Takes in the x,y pairs of interpolating nodes and a given domain or point
%x and returns a point or domain y.
[n,m] = size(xNodes);
if n < m
    n = m;
end
coeff = newtdd(xNodes,yNodes);
y = newtpoly(n-1, coeff, x, xNodes);
end

