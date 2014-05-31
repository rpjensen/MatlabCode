function [area, n] = gaussquad(f, a, b,n)
%Approximate the integral of f from a to b using N nodes by way of 
%Gaussian Quadrature

    [x,w] = lgwt(n,a,b);
    area = 0;
    for iter = 1:n
        area = area + w(iter)*f(x(iter));
    end
end

