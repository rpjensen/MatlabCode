%Exercise B
n = [10 50 100 500 1000 5000];
tol = .5*10^(-6);
for iter = 1:6
    B = [ones(n(iter),1), 2 * ones(n(iter),1), ones(n(iter),1)];
    A = spdiags(B, -1:1, n(iter), n(iter));
    b = zeros(n(iter),1);
    b(1) = 1;
    b(n(iter)) = -1; 
    x0 = zeros(n(iter),1);
    fprintf('gauss seidel\n');
    tic
    [xGS, iterations] = gaussSeidelTenIteration(A,b,x0,tol);
    toc
    fprintf('Run with matrix size %d - %d\n', n(iter), n(iter));
    fprintf('Gauss-Seidel Solution in %d iterations\n\n', iterations);
end