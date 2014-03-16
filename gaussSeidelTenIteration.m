function [xk1, iterations] = gaussSeidelTenIteration(A,b,x0, tol)
%A function to solve systems of equations of the form Ax = b using the
%Gauss-Seidel iterative method.
    iterations = 0;
    [~,n] = size(A);
    xk = x0;%init x(k)
    xk1 = zeros(n,1);%init x(k+1)
    condition = true;
    while (condition)
        for j = 1:n
            xk1(j) = b(j);
            for i = 1:n
                if i < j
                    xk1(j) = xk1(j) - A(j,i)*xk1(i);%lower triangular matrix part
                elseif i > j
                    xk1(j) = xk1(j) - A(j,i)*xk(i);%upper triangluar matrix part
                end
            end
            xk1(j) = xk1(j)/A(j,j);
        end
        iterations = iterations + 1;
        if (norm((xk1 - xk), Inf) < tol)%succesful answer within tolerance
            condition = false;
        end
        if (norm((xk1-xk), Inf)>10000) || (iterations >= 10)%unsuccesful divergence test.
            fprintf('function appears to diverge in %d iterations\n', iterations);
            return;
        end
        xk = xk1;%init x(k) for next iteration
    end
 
end