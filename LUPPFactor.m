function [L, U, P] = LUPPFactor(A)
%Factor a n x n matrix A into L,U using partial pivot row swaps that are 
%captured using the permutation matrix P
    U = A;
    
    [m, n]= size(U);
    %exit program if matrix isn't square
    if m ~= n
        fprintf('The program is only designed for n x n square matrices');
        return;
    end
    P = eye(n);%init P to be the identity
    L = eye(n);%init L to be the identity
    for colJ = 1:n%there is a partial pivot in every column
        pivotIndex = colJ;%pivot index is the column we are in
        maxRow = pivotIndex;%init the maxRow to pivot row since its the first row we care about
        for rowI = pivotIndex + 1 : n%now run throught the rest of the rows in the column
            if abs(U(rowI,pivotIndex)) > abs(U(maxRow, pivotIndex))%test for new max
                maxRow = rowI;%set new max if applicable
            end
        end
        %if a new max has been set (optimization, we could swap pivot row with itself)
        if maxRow ~= pivotIndex
            tempRow = U(pivotIndex, :);%execute swap on U
            U(pivotIndex, :) = U(maxRow, :);
            U(maxRow, :) = tempRow;
            tempRow = P(pivotIndex, :);%execute swap on P
            P(pivotIndex, :) = P(maxRow, :);
            P(maxRow, :) = tempRow;
            %After doing a test case I have found out that you do not
            %permutate L
        end
        for rowI = pivotIndex + 1 : n %for each row under the pivot
            mult = U(rowI, pivotIndex) / U(pivotIndex, pivotIndex);%each row has a multiplier
            L(rowI, pivotIndex) = mult;%save multiplier in L matrix
            U(rowI, pivotIndex) = 0;
            for indexJ = pivotIndex + 1 : n%continue algebra across the whole row
                U(rowI, indexJ) = U(rowI, indexJ) - mult * U(pivotIndex, indexJ);
            end
        end
    end
end

