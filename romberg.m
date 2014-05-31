function [area, n] = romberg(f, a, b, tol, realArea)
%Approximate the integral of f from a to b within a tolerance of tol using
%Romberg Integration
h(1) = b-a;
R(1,1) = h(1)/2*(f(a)+f(b));
j = 1;
k = 1;
n = 1;
while abs(R(j,k) - realArea) > tol
    if j == k
        k = 1;
        h(j+1) = h(j)/2;
        R(j+1,k) = 0;
        for iter = 1:2^(j-1)
            R(j+1,k) = R(j+1,k) + f(a+(2*iter - 1)*h(j+1));
        end
        R(j+1,k) = h(j+1)*R(j+1,k);
        R(j+1,k) = R(j+1,k) + 1/2 * R(j,k);
        j = j+1;
    else
        k = k+1;
        R(j,k) = 4^(k-1) * R(j,k-1) - R(j-1,k-1) / (4^(k-1)-1);
    end
n = n + 1;
end

area = R(j,k);


