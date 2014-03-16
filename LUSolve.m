function x = LUSolve(L, U, b)
%LU solve using matricies L, U, and solution vector b.
	[~, n]= size(L);
 
	c = zeros(n, 1);%init c
	c(1) = b(1) / L(1,1);%solve for first c
	for i = 2 : n%solve for remaining c
    	for j = i - 1 : -1: 1
        	c(i) = c(i) - L(i, j) * c(j);
    	end
  	  c(i) = (c(i) + b(i)) / (L(i,i));
	end
	x = zeros(n,1);
	x(n) = c(n) / U(n,n);%same as gaussian elimination
	for i = n - 1: -1: 1
    	for j = i + 1 : n
        	x(i) = x(i) - U(i, j) * x(j);
    	end
    	x(i) = (x(i)+ c(i)) /U(i,i);
	end
 
end


