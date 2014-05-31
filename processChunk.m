function [XComp] = processChunk(pixelValues, C, Q)
%Use 2D-DCT and quantization to process an 8 by 8 chunk of a photo
%Parameters: pixelValues - 8x8 matrix of grey scale pixel values
%p - loss parameter (1 default, > 1 more compression)
%C - the 2D-DCT transformation matrix (this is to save compuation time since
%it can be computed once one level up)
%Q - the linear quantization matrix (once again this is costant but saves
%time coputing it only once)
%Return: xComp - a matrix with the compressed pixel values

Xd = double(pixelValues);
Y = C * Xd * C';
Yq = round(Y./Q);
Ydq = Yq.*Q;
XComp = C' * Ydq * C;


end

