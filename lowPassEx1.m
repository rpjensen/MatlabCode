x = imread('treeFrogMini8.png');
x = double(x);
x = x - 128;
[~,n] = size(x);
C = zeros(n,n);
for i = 0:n-1
    for j = 0:n-1
        if i == 0
        a = 1 / sqrt(2);
        else
            a = 1;
        end
        C(i+1,j+1) = sqrt(2)/sqrt(8) * a * cos(i*(2*j+1)*pi/(2*n));
    end
end
y = C*x*C';
yLow = y;
for k = 1:n
    for l = 1:n
        if (k + l >= n+1)
            yLow(k,l)= 0;
        end
    end
end

xLow = C*yLow*C';
xLow = xLow + 128;
xLow = uint8(xLow);

xBigger = zeros(22*n, 22*n);
for i = 1:n
    for j = 1:n
        xBigger(22*(i-1)+1:22*i, 22*(j-1)+1:22*j) = xLow(i,j);
    end
end

xBigger = uint8(xBigger);
imagesc(xBigger);
imwrite(xBigger,'lowPassMini8.png');
colormap(gray);


        