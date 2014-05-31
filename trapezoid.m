function [area] = trapezoid(f, a, b, N)
%Approximates the itergral of f on the interval 
%a to b using N trapezoid approximations

h = (b-a)/N;
x = a:h:b;
area = f(a) + f(b);
for iter = 2:N
    area = area + 2*f(x(iter));
end
area = h / 2 * area;
end

