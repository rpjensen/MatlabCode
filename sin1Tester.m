y = zeros(12,1);
y(1) = sin1(1,4);
y(2) = sin1(1,8);
y(3) = sin1(1,12);
y(4) = sin1(1.5,4);
y(5) = sin1(1.5,8);
y(6) = sin1(1.5,12);
y(7) = sin1(2,4);
y(8) = sin1(2,8);
y(9) = sin1(2,12);

real = zeros(12,1);
real(1:3) = sin(1);
real(4:6) = sin(1.5);
real(7:9) = sin(2);

for n = 1:9
    fprintf('%f\n', real(n));
    fprintf('Sin(%f) = %f with %d interpolating points\n',1 + floor((n-1)/3)/2, y(n), 4 + 4 * mod(n-1,3));
end
