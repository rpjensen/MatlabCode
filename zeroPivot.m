function [x] = zeroPivot(A, b)
%Does gaussian elimination with patial pivoting to avoid swamping.
    [~, n]= size(A);
    for colJ = 1:n %for each column we do something
        rowI = colJ + 1;%the first row we try to get a zero in is one below the pivot (j+1, j)
        pivotIndex = colJ;%same as the pivot for each column
        if A(colJ, colJ) == 0
           nonZeroIndex = -1;%init to nonreal index
            for rowIndex = pivotIndex + 1:n%all rows beneath zero pivot
               if A(rowIndex, colJ) ~= 0
                   nonZeroIndex = rowIndex;%non zero value
                   break;
               end
            end
            if nonZeroIndex ~= -1%if we found a nonzero value swap the rows
                tempRow = A(pivotIndex,:);
                A(colJ,:) = A(nonZeroIndex, :);%swap rows
                A(nonZeroIndex,:) = tempRow;
            end
        end
        for iter = 1 : (n - colJ)%for the number of rows beneath that pivot
            mult = A(rowI, colJ) / A(pivotIndex, colJ);%each row has its own mulitpiler
            A(rowI, colJ) = 0;%first cell is zero by design
            for indexJ = colJ + 1 : n;%the algebra for the rest of the columns in each row
                A(rowI, indexJ) = A(rowI, indexJ) - mult * A(pivotIndex, indexJ);%each row equals itself - the multiplier times the value from the pivot row
            end
            b(rowI) = b(rowI) - mult * b(pivotIndex);% do the same algebra for the b vector
            rowI = rowI + 1;
        end
    end
    x = zeros(1, n);%init a new vector the same length as the matrix dimensions
    x(n) = b(n) / A(n,n);%first solution of the backsolve
    for i = n - 1: -1: 1%backsolve.....backwards through the solution vector
        for j = i + 1 : n%take the orgiginal sum and minus the previous solutions * their cooresponding A value in this row
            x(i) = x(i) - A(i, j) * x(j);
        end
        x(i) = (x(i)+ b(i)) / (A(i,i));%add the constant b value and divide by the cooresponding A value of the given solution
    end
    x = x';%make x a vertical vector
 
end
