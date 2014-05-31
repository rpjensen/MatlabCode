function [t,y] = eulermethod(f,t0,tf,y0,h)

N = ceil((tf - t0)/h);
            %Make sure that N is a whole number at least as big as we need
t = zeros(N+1,1);%init t for N+1 things since we have [0,N] indexs
y = zeros(N+1,1);%init y for N+1 things since we have [0,N] indexs

%initial value problem
t(1) = t0;
y(1) = y0;

for j = 1:N
    t(j+1) = t(j)+ h;%next t
    y(j+1) = y(j) + h*f(t(j),y(j));%next y
end

end

