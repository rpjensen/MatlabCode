f1 = @(x)2.* x;
a1 = 0;
b1 = 1;
real1 = 1;

f2 = @(x) x.^2 - 3.*x;
a2 = 1;
b2=5;
real2 = 16/3;

f3 = @(x) 4.*x.^3 + x.^2;
a3 = 3;
b3 = 4;
real3 = 562/3;

f4 = @(x) 5.*x.^4 + 7.*x - 2;
a4 = -1;
b4 = 3;
real4 = 264;

N = 1:10;
h = zeros(10,2,4);
error = zeros(10,2,4);
area = zeros (10,2,4);

for iter = 1:10
    area(iter,:, 1) = [trapezoid(f1,a1,b1,N(iter)), simpson(f1,a1,b1,N(iter))];
    area(iter,:, 2) = [trapezoid(f2,a2,b2,N(iter)), simpson(f2,a2,b2,N(iter))];
    area(iter,:, 3) = [trapezoid(f3,a3,b3,N(iter)), simpson(f3,a3,b3,N(iter))];
    area(iter,:, 4) = [trapezoid(f4,a4,b4,N(iter)), simpson(f4,a4,b4,N(iter))];
    error(iter,:,1) = [abs(area(iter,1,1)-real1), abs(area(iter,2,1)-real1)];
    error(iter,:,2) = [abs(area(iter,1,2)-real2), abs(area(iter,2,2)-real2)];
    error(iter,:,3) = [abs(area(iter,1,3)-real3), abs(area(iter,2,3)-real3)];
    error(iter,:,4) = [abs(area(iter,1,4)-real4), abs(area(iter,2,4)-real4)];
    h(iter,:,1) = [(b1-a1)/N(iter), (b1-a1)/2/N(iter)];
    h(iter,:,2) = [(b2-a2)/N(iter), (b2-a2)/2/N(iter)];
    h(iter,:,3) = [(b3-a3)/N(iter), (b3-a3)/2/N(iter)];
    h(iter,:,4) = [(b4-a4)/N(iter), (b4-a4)/2/N(iter)];
end

grid on
figure(1);
plot(log10(h(:,1,1)), log10(error(:,1,1)), 'bo-', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
plot(log10(h(:,2,1)), log10(error(:,2,1)), 'rv-.', 'LineWidth', 1.5, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Trapezoid', 'Simpson', 'Location', 'NorthWest');
title('f(x) = 2x');
grid on
hold off

figure(2);
plot(log10(h(:,1,2)), log10(error(:,1,2)), 'bo-', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
plot(log10(h(:,2,2)), log10(error(:,2,2)), 'rv-.', 'LineWidth', 1.5, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Trapezoid', 'Simpson', 'Location', 'NorthWest');
title('f(x) = x^2 - 3x');
grid on
hold off

figure(3);
plot(log10(h(:,1,3)), log10(error(:,1,3)), 'bo-', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
plot(log10(h(:,2,3)), log10(error(:,2,3)), 'rv-.', 'LineWidth', 1.5, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Trapezoid', 'Simpson', 'Location', 'NorthWest');
title('f(x) = 4x^3 + x^2');
grid on
hold off

figure(4);
plot(log10(h(:,1,4)), log10(error(:,1,4)), 'bo-', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
plot(log10(h(:,2,4)), log10(error(:,2,4)), 'rv-.', 'LineWidth', 1.5, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Trapezoid', 'Simpson', 'Location', 'NorthWest');
title('f(x) = 5x^4 + 7x - 2');
grid on
hold off



