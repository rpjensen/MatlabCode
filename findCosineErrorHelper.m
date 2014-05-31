tolerance = .5 * 10E-10;
for x = 0:.1:4*pi
    n = findCosineError(x,tolerance);
    fprintf('%d      ', n);
    if (mod(x,1) == 0) && x~=0
        fprintf('\n');
    end
end
fprintf('\n');