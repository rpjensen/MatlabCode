f = @(x) -exp(x)*log(x);
a1 = 1;
b1 = 2;
a2 = 0 + 10*eps;
b2 = 1;

nTrap = 10000000;
hTrap = 1/nTrap;
nSimp = 5000000;
hSimp = 1/(2*nSimp);
nGQ = 5000;

area = zeros(2,3);

area(1,1) = trapezoid(f,a1,b1,nTrap);
area(1,2) = simpson(f,a1,b1,nSimp);
area(1,3) = gaussquad(f,a1,b1,nGQ);

fprintf('Trapezoid: area = %.8f, h = %.10f, n = %f\n',area(1,1), hTrap, nTrap);
fprintf('Simpson: area = %.8f, h = %.10f, n = %f\n', area(1,2), hSimp, nSimp);
fprintf('Gauss Quad: area = %.8f, n = %f\n', area(1,3), nGQ);

area(2,1) = trapezoid(f,a2,b2,nTrap);
area(2,2) = simpson(f,a2,b2,nSimp);
area(2,3) = gaussquad(f,a2,b2,nGQ);

fprintf('Trapezoid: area = %.8f, h = %.10f, n = %f\n',area(2,1), hTrap, nTrap);
fprintf('Simpson: area = %.8f, h = %.10f, n = %f\n', area(2,2), hSimp, nSimp);
fprintf('Gauss Quad: area = %.8f, n = %f\n', area(2,3), nGQ);

