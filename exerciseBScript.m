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
    fprintf('jacobi\n');
    tic
    [xJacobi, iterations] = jacobi(A,b,x0,tol);
    toc
    
    fprintf('Run with matrix size %d - %d\n', n(iter), n(iter));
    fprintf('Jacobi Solution in %d iterations\n\n', iterations);
    %{
    fprintf('gauss seidel\n');
    tic
    [xGS, iterations] = gaussSeidel(A,b,x0,tol);
    toc
    fprintf('Run with matrix size %d - %d\n', n(iter), n(iter));
    fprintf('Gauss-Seidel Solution in %d iterations\n\n', iterations);
    %}
    if n(iter)<500%it took way too long for gauss to work.  I have to do my homework in the mathlab and couldn't stand to wait.
        fprintf('Gauss\n');
        tic
        [xGauss] = gauss(A,b);
        toc
        fprintf('Run with matrix size %d - %d\n\n\n', n(iter), n(iter));
    end
end

