t0 = 1;
tf = 2;
y0 = 0;

h = zeros(6,1);
h(1) = .1;
for iter = 2:6
    h(iter) = h(iter-1)/2;
end
t1 = t0:h(1):tf;
t2 = t0:h(2):tf;
t3 = t0:h(3):tf;
t4 = t0:h(4):tf;
t5 = t0:h(5):tf;
t6 = t0:h(6):tf;

tTrue = t0:.001:tf;
yTrue = @(tt) tt.^(2).*(exp(tt)-exp(1));
dy = @(t,y) 2./t.*y + t.^2.*exp(t);

[~,yEuler1] = eulermethod(dy,t0,tf,y0,h(1));
[~,yEuler2] = eulermethod(dy,t0,tf,y0,h(2));
[~,yEuler3] = eulermethod(dy,t0,tf,y0,h(3));
[~,yEuler4] = eulermethod(dy,t0,tf,y0,h(4));
[~,yEuler5] = eulermethod(dy,t0,tf,y0,h(5));
[~,yEuler6] = eulermethod(dy,t0,tf,y0,h(6));

errorEuler = abs([yEuler1(length(yEuler1))-yTrue(tf), yEuler2(length(yEuler2))-yTrue(tf), yEuler3(length(yEuler3))-yTrue(tf),  yEuler4(length(yEuler4))-yTrue(tf), yEuler5(length(yEuler5))-yTrue(tf), yEuler6(length(yEuler6))-yTrue(tf)]);

[~,yTrap1] = trapmethod(dy,t0,tf,y0,h(1));
[~,yTrap2] = trapmethod(dy,t0,tf,y0,h(2));
[~,yTrap3] = trapmethod(dy,t0,tf,y0,h(3));
[~,yTrap4] = trapmethod(dy,t0,tf,y0,h(4));
[~,yTrap5] = trapmethod(dy,t0,tf,y0,h(5));
[~,yTrap6] = trapmethod(dy,t0,tf,y0,h(6));

errorTrap = abs([yTrap1(length(yTrap1))-yTrue(tf), yTrap2(length(yTrap2))-yTrue(tf), yTrap3(length(yTrap3))-yTrue(tf),  yTrap4(length(yTrap4))-yTrue(tf), yTrap5(length(yTrap5))-yTrue(tf), yTrap6(length(yTrap6))-yTrue(tf)]);

[~,yRk41] = rk4(dy,t0,tf,y0,h(1));
[~,yRk42] = rk4(dy,t0,tf,y0,h(2));
[~,yRk43] = rk4(dy,t0,tf,y0,h(3));
[~,yRk44] = rk4(dy,t0,tf,y0,h(4));
[~,yRk45] = rk4(dy,t0,tf,y0,h(5));
[~,yRk46] = rk4(dy,t0,tf,y0,h(6));

errorRk4 = abs([yRk41(length(yRk41))-yTrue(tf), yRk42(length(yRk42))-yTrue(tf), yRk43(length(yRk43))-yTrue(tf),  yRk44(length(yRk44))-yTrue(tf), yRk45(length(yRk45))-yTrue(tf), yRk46(length(yRk46))-yTrue(tf)]);

figure(1)
plot(log10(h(:)),log10(errorEuler(:)), 'ro');
hold on
plot(log10(h(:)),log10(errorTrap(:)), 'gv');
plot(log10(h(:)),log10(errorRk4(:)), 'c*');
xlabel('log(h)');
ylabel('log(Error)');
legend('Euler Method', 'Exp. Trap', 'RK4', 'Location', 'NorthWest');
title('Error vs Step Size evaluated at tf');
axis equal
hold off

t = t0:.1:tf;
y = yTrue(t0:.01:tf);

figure(2)
plot(t0:.01:tf, y, 'm-', 'LineWidth', 2);
hold on
plot(t(:),yEuler1(:), 'ro');
plot(t(:),yTrap1(:), 'gv');
plot(t(:),yRk41(:), 'c*');
xlabel('t');
ylabel('y(t)');
legend('True', 'Euler Method', 'Exp. trap', 'RK4', 'Location', 'NorthWest');
title('The real function y(t) vs the Three Approximations');
hold off

y = yTrue(t);
figure(3)
plot(t(:), log10(abs(y-yEuler1')), 'ro');
hold on
plot(t(:), log10(abs(y-yTrap1')), 'gv');
plot(t(:), log10(abs(y-yRk41')), 'c*');
xlabel('t');
ylabel('log(real-approxmate)');
legend('Euler Method', 'Exp.Trap', 'RK4', 'Location', 'NorthWest');
title('Error Residuals vs time');
hold off