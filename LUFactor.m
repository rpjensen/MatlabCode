function [L, U] = LUFactor(A)
%Uses gaussian elimination to turn a square matrix A into a row reduced upper
%triangular matrix(U) and a lower triangluar matrix(L) which are the
%multipliers for LU factoring.
	[~, n]= size(A);
	L = eye(n);%init L to be the identity
	for colJ = 1:n%this is the same as the gauss code except no b vector and the multiplers go into place in L
    	rowI = colJ + 1;
    	multRowIndex = colJ;
    	for iter = 1 : (n - colJ)
       	mult = A(rowI, colJ) / A(multRowIndex, colJ);
       	L(rowI, colJ) = mult;
       	A(rowI, colJ) = 0;
       	for indexJ = colJ + 1 : n;
            	A(rowI, indexJ) = A(rowI, indexJ) - mult * A(multRowIndex, indexJ);
       	end
       	rowI = rowI + 1;
    	end
	end
	U = A;
end


