f = @(x) sin(x);%Function
df = @(x) cos(x);%derivative
x = pi/6;%evaluated at
h = zeros(25,1);%25 different step sizes
h(1) = .1;%starting step size
trueValue = df(x);%true value
results = zeros(25,4);%the evaulated derivateve
estError = zeros(25,4);%the error estimated from the Order Analysis
realError = zeros(25,4);%the real error as the abs(real - result)

for iter = 1:25
    [results(iter,1), estError(iter,1)] = threePtCenter(f, x, h(iter));
    %column one of our rectangle matrices is for three pt center
    [results(iter,2), estError(iter,2)] = threePtForward(f, x, h(iter));
    %column two of our rectangle matrices is for three pt forward
    [results(iter,3), estError(iter,3)] = fivePtCenter(f, x, h(iter));
    %column three of our rectangle matrices is for five pt center
    [results(iter,4), estError(iter,4)] = fivePointForward(f, x, h(iter));
    %column four of our rectangle matrices if for five pt forward
    realError(iter, :) = abs(results(iter, :) - trueValue);
    %for each row calculate the real error
    
    %print results and errors
    fprintf('Results for h = %.16f: (3)pt center -> %.6f, Real Error - > %.6f, Estimated Error -> %.6f\n', h(iter), results(iter,1), realError(iter,1), estError(iter,1));
    fprintf('Results for h = %.16f: (3)pt forward -> %.6f, Real Error - > %.6f, Estimated Error -> %.6f\n', h(iter), results(iter,2), realError(iter,2), estError(iter,2));
    fprintf('Results for h = %.16f: (5)pt center -> %.6f, Real Error - > %.6f, Estimated Error -> %.6f\n', h(iter), results(iter,3), realError(iter,3), estError(iter,3));
    fprintf('Results for h = %.16f: (5)pt forward -> %.6f, Real Error - > %.6f, Estimated Error -> %.6f\n', h(iter), results(iter,4), realError(iter,4), estError(iter,4));
    fprintf('------------------------------------------------------------------------------------------------\n\n\n');
    
    if iter < 25
        h(iter+1) = h(iter) / 2;%set the next h as half this h
    end
    
    
end

%plot each function on its own plot and use actual figure numbers so that
%it doesn't get messed up making A LOT of figures :)
figure(1);
loglog(h, realError(:,1), 'b-o', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
loglog(h, estError(:,1),'LineStyle', 'none','Marker', '*', 'MarkerEdgeColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Real Error', 'Order estimate of Error', 'Location', 'NorthWest');
title('Three Point Center Difference');
hold off

figure(2);
loglog(h, realError(:,2), 'b-o', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
loglog(h, estError(:,2),'LineStyle', 'none','Marker', '*', 'MarkerEdgeColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Real Error', 'Order estimate of Error', 'Location', 'NorthWest');
title('Three Point Forward Difference');
hold off

figure(3);
loglog(h, realError(:,3), 'b-o', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
loglog(h, estError(:,3),'LineStyle', 'none','Marker', '*', 'MarkerEdgeColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Real Error', 'Order estimate of Error', 'Location', 'NorthWest');
title('Five Point Center Difference');
hold off

figure(4);
loglog(h, realError(:,4), 'b-o', 'LineWidth', 1.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
hold on
loglog(h, estError(:,4),'LineStyle', 'none','Marker', '*', 'MarkerEdgeColor', 'r', 'MarkerSize', 8);
xlabel('Log(h)');
ylabel('Log(Error)');
legend('Real Error', 'Order estimate of Error', 'Location', 'NorthWest');
title('Five Point Forward Difference');
hold off

%to find the slope take the actual log of the values
logRealErr = log(realError);
logH = log(h);

%once I ran up to this part a few times I was able to add the slope part below
%now that I know which parts are 'well-behaved'
slopes = zeros(4,1);

%I added the negative since our h's are getting smaller each time.  I
%thought it made more sense for negitve slope to coorespond to less error
%each iteration
slopes(1) = -(logRealErr(13,1) - logRealErr(1,1)) / (logH(13) - logH(1));
slopes(2) = -(logRealErr(13,2) - logRealErr(1,2)) / (logH(13) - logH(1));
slopes(3) = -(logRealErr(6,3) - logRealErr(1,3)) / (logH(6) - logH(1));
slopes(4) = -(logRealErr(13,4) - logRealErr(1,4)) / (logH(13) - logH(1));
fprintf('The three point center dif slope was %.4f using the first %d pts\n', slopes(1), 13);
fprintf('The three point forward dif slope was %.4f using the first %d pts\n', slopes(2), 13);
fprintf('The five point center dif slope was %.4f using the first %d pts\n', slopes(3), 6);
fprintf('The five point forward dif slope was %.4f using the first %d pts\n', slopes(4), 13);

minErrorAndIndex = [realError(1,:); h(1) h(1) h(1) h(1)];
for iter = 2:25
    if (realError(iter,1) < minErrorAndIndex(1,1))
        minErrorAndIndex(1,1) = realError(iter,1);
        minErrorAndIndex(2,1) = h(iter);
    end
    if (realError(iter,2) < minErrorAndIndex(1,2))
    minErrorAndIndex(1,2) = realError(iter,2);
    minErrorAndIndex(2,2) = h(iter);
    end
    if (realError(iter,3) < minErrorAndIndex(1,3))
    minErrorAndIndex(1,3) = realError(iter,3);
    minErrorAndIndex(2,3) = h(iter);
    end
    if (realError(iter,4) < minErrorAndIndex(1,4))
    minErrorAndIndex(1,4) = realError(iter,4);
    minErrorAndIndex(2,4) = h(iter);
    end
end
fprintf('Three pt center dif least error %.16f at h = %.16f\n', minErrorAndIndex(1,1), minErrorAndIndex(2,1));
fprintf('Three pt forward dif least error %.16f at h = %.16f\n', minErrorAndIndex(1,2), minErrorAndIndex(2,2));
fprintf('Five pt center dif least error %.16f at h = %.16f\n', minErrorAndIndex(1,3), minErrorAndIndex(2,3));
fprintf('Five pt forward dif least error %.16f at h = %.16f\n', minErrorAndIndex(1,4), minErrorAndIndex(2,4));