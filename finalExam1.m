f = @(x) exp(x)*log(x);

h3pc = .000000001;
h5pc = .0000001;

x = [1 .1 .01 .001];
df = zeros(4,2);
for iter = 1:4
    df(iter,1) = threePtCenter(f,x(iter),h3pc);
    df(iter,2) = fivePtCenter(f,x(iter),h5pc);
    fprintf('3pt Center: x = %.5f, h = %.9f, df = %.8f\n', x(iter), h3pc, df(iter,1));
    fprintf('5pt Center: x = %.5f, h = %.7f, df = %.8f\n', x(iter), h5pc, df(iter,2));
end

