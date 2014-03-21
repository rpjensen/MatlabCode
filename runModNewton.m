function [iterations, solutions] = runModNewton(f, df, a, b, m, tol)
%runs the modified newton's method with ten initial guesses spread evenly
%over the given interval [a,b].  This function passes the remaining
%parameters off to the modNewtonMethod.
initialGuessDifference = (b - a)/10;%difference between two initial guesses
iterations = zeros(11,1);%Track the iterations of each inital guess
solutions = zeros(11,1);%Track the solution of each initial guess
i = 1;
for x0 = a:initialGuessDifference:b
    if ~(abs(x0)< .5* 10E-6)%avoid using a initial guess of x = 0
    [solutions(i), iterations(i)] = modNewtonMethod(f,df,x0,m,tol,iterations(i));
    %returns the given solution and iteration count
    fprintf('Initial Guess: %5.2f, Solution: %15.8f\n', x0, solutions(i));
    %prints the initial guess and solution from that guess.
    end
    i = i + 1;
end

end

