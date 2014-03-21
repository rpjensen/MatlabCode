function [x] = partialPivot(Aorig, b)
%Does gaussian elimination with patial pivoting to avoid swamping.
    A = Aorig;%this allows us to see what A looks like during debugging in the variable consule by making a copy
    [m, n]= size(A);
    %exit program if matrix isn't square
    if m ~= n
        fprintf('The program is only designed for n x n square matrices');
        return;
    end
    for colJ = 1:n %for each column we have a partial pivot
        pivotIndex = colJ;%same as the pivot for each column
        maxRow = pivotIndex;%init to first row
        for rowI = pivotIndex + 1: n
            if (abs(A(rowI,pivotIndex)) > abs(A(maxRow, pivotIndex)))
                maxRow = rowI;%new max row
            end    
        end
        if maxRow ~= pivotIndex
            tempRow = A(pivotIndex,:);
            A(pivotIndex,:) = A(maxRow, :);%swap rows in A
            A(maxRow,:) = tempRow;
            tempB = b(pivotIndex);%swap rows in b vector
            b(pivotIndex) = b(maxRow);
            b(maxRow) = tempB;
        end
        
        for rowI = pivotIndex + 1 : n%for the rows beneath that pivot
            mult = A(rowI, pivotIndex) / A(pivotIndex, pivotIndex);%each row has its own mulitpiler
            A(rowI, pivotIndex) = 0;%first cell is zero by design
            for indexJ = colJ + 1 : n;%the algebra carrys through the whole row
                A(rowI, indexJ) = A(rowI, indexJ) - mult * A(pivotIndex, indexJ);%each row equals itself - the multiplier times the value from the pivot row
            end
            b(rowI) = b(rowI) - mult * b(pivotIndex);% do the same algebra for the b vector as well
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


