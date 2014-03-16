function root = bisectionMethod(f, a, b, tol)
% This function uses the bisectionMethod to find the root of a function in
% the interval [a,b] to a certain tolerance.
	if a == b
    	fprintf('The endpoints of the interval are equal \n');
    	return;
	end
	if a < b
    	leftEndPoint = a;
    	rightEndPoint = b;
	else
    	leftEndPoint = b;
    	rightEndPoint = a;
	end %allow user to not have a less than b
 
	if (f(leftEndPoint) > 0 && (f(rightEndPoint) > 0) ) || (f(leftEndPoint) < 0 && f(rightEndPoint) < 0)
    	fprintf('One end point should be positive and the other negative\n to ensure you get the root you want\n');
    	return;
	end %avoids confusion and infinite loops if no roots exist between the %points
	midPoint = (a + b)/2;
	while (f(midPoint) > tol ) || (f(midPoint) < -tol)
    	if (f(midPoint) > 0)
        	if (f(leftEndPoint) > 0 )
            	leftEndPoint = midPoint; %midpoint > 0 && left endpoint > 0
        	else
            	rightEndPoint = midPoint; %midpoint > 0 and right endPoint > 0
        	end
    	else
        	if (f(leftEndPoint) < 0 )
           	leftEndPoint = midPoint; %midpoint < 0 and left end point < 0
        	else
            	rightEndPoint = midPoint;%midpoint < 0 and right end point < 0
        	end
    	end
    	midPoint = (leftEndPoint + rightEndPoint) / 2; % new midpoint
	end
	root = midPoint; % if we are within the tolerance (out of the while loop) we are done
end


