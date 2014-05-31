function [t, y] = rk4(f, t0, tf, y0, h)
%Rk4 method for differential equations

N = ceil((tf - t0)/h);
            %Make sure that N is a whole number at least as big as we need
t = zeros(N+1,1);%init t for N+1 things since we have [0,N] indexs
y = zeros(N+1,1);%init y for N+1 things since we have [0,N] indexs

%initial value problem
t(1) = t0;
y(1) = y0;

for j = 1:N
    t(j+1) = t(j)+ h;%next t
    
    s1 = f(t(j),y(j));%euler method
    s2 = f(t(j)+h/2, y(j)+h/2*s1);%half slope from half step
    s3 = f(t(j)+h/2, y(j)+h/2*s2);%half s2 slope from half step
    s4 = f(t(j)+h, y(j)+h*s3);%full s3 slope from full step
    y(j+1) = y(j) + h/6*(s1+2*s2+2*s3+s4);
                            %average of the 6 slopes times the step size
end

end

