function [x] = LUPPSolve(L, U, P, b)
%Solve a system for a given b vector using the results from LUPPFactor.
%Those results being the multiplier matrix L upper matrix U and the
%permuation matrix P.
    [~, n] = size(L);
    y = P * b;%we turn P * b into a vector and use that vector for the remainder of the compuation
    c = zeros(n, 1);%init c
    c(1) = y(1) / L(1,1);%solve for the first c entry
    for i = 2 : n%this is a forward solve since L is lower triangular
        for j = i - 1 : -1: 1%we subtract all entries prior to i * their cooresponding L entry
            c(i) = c(i) - L(i, j) * c(j);
        end
        c(i) = (c(i) + y(i)) / (L(i,i));%finally add the cooresponding y entry and divide by the cooresponding L entry
    end
    x = zeros(n,1);%init x
    x(n) = c(n) / U(n,n);%solve for the first entry in x
    %this is a backsolve since U is upper triangular
    for i = n - 1: -1: 1%backsolve through the remaining entries in x
        for j = i + 1 : n
            x(i) = x(i) - U(i, j) * x(j);%subtract all x entries we know (larger ones) * their cooresponding U entry
        end
        x(i) = (x(i)+ c(i)) /U(i,i);%finally add the cooresponding c entry and divide by the U entry
    end

end

