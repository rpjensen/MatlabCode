function root = newtonMethod(f, df, x0, tol)
%This function uses the newton method to calculate the root of a function to a %certain tolerance.
	x1 = x0 - (f(x0) / df(x0)); %init x_(j+1)
	while abs(x1 - x0) > tol
    	x0 = x1;
    	x1 = x0 - (f(x0) / df(x0));
	end
	root = x1;
end

