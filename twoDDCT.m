function [ ] = twoDDCT(imageFileName)
%Creates three versions of a compressed version of the given image
%grey scale using quantizized 2D-DCT with a loss parameter of 1,2,4
X = imread(imageFileName);
[height, width] = size(X);
Xd = double(X);
Xc = Xd - 128;
C = zeros(8,8);
Qp = zeros(8,8);
for i = 0:7
    for j = 0:7
        if i == 0
        a = 1 / sqrt(2);
        else
            a = 1;
        end
        C(i+1,j+1) = sqrt(2)/sqrt(8) * a * cos(i*(2*j+1)*pi/(2*8));
        Qp(i+1,j+1) = 8 *(i + j + 1);
    end
end

xBlocks = floor(width/8);
yBlocks = floor(height/8);
xRemainder = mod(width,8);
yRemainder = mod(height,8);

p = 1;
Q = p * Qp;
Xp1 = zeros(height,width);
for i = 1:yBlocks
    for j = 1:xBlocks
        Xp1(8*i-7:8*i, 8*j-7:8*j) = processChunk(Xc(8*i-7:8*i,8*j-7:8*j),C,Q);
    end
end

if yRemainder ~= 0
    for j = 1:xBlocks
        temp8 = processChunk(Xc(height-7:height, 8*j-7:8*j),C,Q);
        Xp1(height-yRemainder + 1:height, 8*j-7:8*j) = temp8(8-yRemainder + 1:8, 1:8);
    end
end

if xRemainder ~= 0
    for i = 1:yBlocks
        temp8 = processChunk(Xc(8*i-7:8*i, width-7:width),C,Q);
        Xp1(8*i-7:8*i, width - xRemainder + 1:width) = temp8(1:8, 8 - xRemainder + 1:8);
    end
end

if xRemainder ~= 0 && yRemainder ~= 0 
    temp8 = processChunk(Xc(height - 7:height, width - 7: width),C,Q);
    Xp1(height-yRemainder + 1:height, width - xRemainder + 1:width) = temp8(8 -yRemainder + 1:8, 8 - xRemainder + 1:8);
end

Xp1 = Xp1 + 128;
Xp1 = uint8(Xp1);
imwrite(Xp1, 'tree_frog_p1.png');

p = 2;
Q = p * Qp;
Xp2 = zeros(height,width);
for i = 1:yBlocks
    for j = 1:xBlocks
        Xp2(8*i-7:8*i, 8*j-7:8*j) = processChunk(Xc(8*i-7:8*i,8*j-7:8*j),C,Q);
    end
end

if yRemainder ~= 0
    for j = 1:xBlocks
        temp8 = processChunk(Xc(height-7:height,8*j-7:8*j),C,Q);
        Xp2(height-yRemainder + 1:height, 8*j-7:8*j) = temp8(8-yRemainder + 1:8, 1:8);
    end
end

if xRemainder ~= 0
    for i = 1:yBlocks
        temp8 = processChunk(Xc(8*i-7:8*i, width-7:width),C,Q);
        Xp2(8*i-7:8*i, width - xRemainder + 1:width) = temp8(1:8, 8 - xRemainder + 1:8);
    end
end

if xRemainder ~= 0 && yRemainder ~= 0 
    temp8 = processChunk(Xc(height - 7:height, width - 7: width),C,Q);
    Xp2(height-yRemainder + 1:height, width - xRemainder + 1:width) = temp8(8-yRemainder + 1:8, 8 - xRemainder + 1:8);
end

Xp2 = Xp2 + 128;
Xp2 = uint8(Xp2);
imwrite(Xp2, 'tree_frog_p2.png');

p = 4;
Q = p * Qp;
Xp4 = zeros(height,width);
for i = 1:yBlocks
    for j = 1:xBlocks
        Xp4(8*i-7:8*i, 8*j-7:8*j) = processChunk(Xc(8*i-7:8*i,8*j-7:8*j),C,Q);
    end
end

if yRemainder ~= 0
    for j = 1:xBlocks
        temp8 = processChunk(Xc(height-7:height,8*j-7:8*j),C,Q);
        Xp4(height-yRemainder + 1:height, 8*j-7:8*j) = temp8(8-yRemainder + 1:8, 1:8);
    end
end

if xRemainder ~= 0
    for i = 1:yBlocks
        temp8 = processChunk(Xc(8*i-7:8*i, width-7:width),C,Q);
        Xp4(8*i-7:8*i, width - xRemainder + 1:width) = temp8(1:8, 8 - xRemainder + 1:8);
    end
end

if xRemainder ~= 0 && yRemainder ~= 0 
    temp8 = processChunk(Xc(height - 7:height, width - 7: width),C,Q);
    Xp4(height-yRemainder + 1:height, width - xRemainder + 1:width) = temp8(8-yRemainder + 1:8, 8 - xRemainder + 1:8);
end
Xp4 = Xp4 + 128;
Xp4 = uint8(Xp4);
imwrite(Xp4, 'tree_frog_p4.png');
end

