function [n] = printNewtonDDPoly(xNodes , yNodes)
%Print the polynomial from newton divided difference
coeff = newtdd(xNodes,yNodes);
n = length(coeff);
    fprintf('P(x) = ');
for iter = 1:n
    if iter == 1
        fprintf('%4.4f ', coeff(iter));
    else
        fprintf(' + %4.4f', coeff(iter));
        for inner = 1:iter-1
            fprintf('(x - %3.2f)', xNodes(inner));
        end
    end
    
end
fprintf('\n');

end

