function [] = printVector(v, name)
%Prints a vertical vector
[n,~] = size(v);
for i = 1:n
    blankString = '';
    if i == floor(n/2)
        fprintf('%20s = |%8.6f|\n', name, v(i));
    else
        fprintf('%20s   |%8.6f|\n',blankString,v(i));
    end
end


end

