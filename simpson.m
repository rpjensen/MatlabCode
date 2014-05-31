function [area] = simpson(f, a, b, N)
%Approximates the itergral of f on the interval 
%a to b using N quadratic approximations

h = (b-a)/(2*N);
x = a:h:b;
area = f(a) + f(b);
for iter = 2:2*N
    if mod(iter,2) == 0
        area = area + 4 * f(x(iter));
    else
        area = area + 2*f(x(iter));
    end

end
area = h / 3 * area;
end
