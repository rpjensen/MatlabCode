function [x1, iterations] = modNewtonMethod(f, df, x0, m, tol, iterations)
%This function uses the newton method to calculate the root of a function to a 
%certain tolerance.
    
    conditionNotMet = true;%using a condition flag to put the initialization
    %in the first go though the loop.
    while conditionNotMet
        if abs(df(x0)) < eps
            fprintf('Divide By Zero')%temporarily delay the crash that might happen by dividing by zero
            return;
        end
        x1 = x0 - (m * f(x0) / df(x0));%formula for modified newton method
        x0 = x1;%set the initial vector for the next go round
        iterations = iterations + 1;%track iterations for debugging
        if abs(f(x0)) < tol && iterations < 500
            conditionNotMet = false;%one of two stop conditions
        end
    end
    if iterations >= 500
        fprintf('The function hasn''t converged after %d iterations', iterations);
        %print diverges message
        return;
    end
end

