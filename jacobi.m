function [xk1, iterations] = jacobi(A, b, x0, tol) 
%Iterative method for solving systems of equations in the form Ax = b
    iterations = 0;
    [~, n] = size(A);
    xk = x0;%init x(k)
    xk1 = zeros(n,1);%init x(k+1)
    D = eye(n);
    LU = zeros(n);
    for i = 1:n%initilize D and LU
       for j = 1:n
           if i == j
              D(i,j) = A(i,j); 
           else 
                LU(i,j) = A(i,j);
           end
       end
    end
    DInv = inv(D);%compute inverse
    condition = true;
    while (condition)
        xk1 = DInv * (b - (LU * xk));%jacobian computation
        iterations = iterations + 1;
        if (norm((xk1 - xk), Inf) < tol)%successful solution within tolerance
            condition = false;
        end
        if (norm((xk1-xk), Inf)>10000) || (iterations >= 20000)%test for divergence
            fprintf('function appears to diverge in %d iterations\n', iterations);
            return;
        end
        xk = xk1;%reset for next iteration
    end
    
 
end
