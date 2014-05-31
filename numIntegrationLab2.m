tol = .5 * 10^(-8);

f1 = @(x) x.^x;
a1 = 0;
b1 = 1;
realArea1 = integral(f1,a1,b1);

f2 = @(x) cos(exp(x));
a2 = 0;
b2 = pi;
realArea2 = integral(f2,a2,b2);

f3 = @(x) 1/sqrt(2*pi)*exp((-x).^2/2);
a3 = -3;
b3 = 3;
realArea3 = integral(f3,a3,b3);

area = zeros(2,3);
n = zeros(2,3);

disp('f1 Romberg')
tic
[area(1,1),n(1,1)] = romberg(f1,a1,b1,tol,realArea1);
toc
fprintf('f1 Romberge area: %.8f, f1 real area: %.8f, n: %d\n\n',area(1,1),realArea1, n(1,1));

disp('f2 Romberg')
tic
[area(1,2),n(1,2)] = romberg(f2,a2,b2,tol,realArea2);
toc
fprintf('f2 Romberge area: %.8f, f2 real area: %.8f, n: %d\n\n',area(1,2),realArea2, n(1,2));

disp('f3 Romberg')
tic
[area(1,3),n(1,3)] = romberg(f3,a3,b3,tol,realArea3);
toc
fprintf('f3 Romberge area: %.8f, f3 real area: %.8f, n: %d\n\n',area(1,3),realArea3, n(1,3));


disp('f1 Gauss Quad')
tic
[area(2,1), n(2,1)] = gausssquad(f1,a1,b1,tol,realArea1);
toc
fprintf('f1 Gaussquad area: %.8f, f1 real area: %.8f, n: %d\n\n',area(2,1),realArea1, n(2,1));

disp('f2 Gauss Quad')
tic
[area(2,2), n(2,2)] = gausssquad(f2,a2,b2,tol,realArea2);
toc
fprintf('f2 Gaussquad area: %.8f, f2 real area: %.8f, n: %d\n\n',area(2,2),realArea2, n(2,2));


disp('f3 Gauss Quad')
tic
[area(2,3), n(2,3)] = gausssquad(f3,a3,b3,tol,realArea3);
toc
fprintf('f3 Gaussquad area: %.8f, f3 real area: %.8f, n: %d\n\n',area(2,3),realArea3, n(2,3));




