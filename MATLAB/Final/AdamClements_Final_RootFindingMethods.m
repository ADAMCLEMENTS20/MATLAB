clear; close; clc;
%Author: Adam Clements
%Summary: use 3 methods (secant, newton's, and bisection) to approximate
%the roots of functions, and return the error, error ratio, and value for
%each iteration of each method
%--------------------------------------------------------------------------
%Variables
f = @(x) x^2-3;
g = @(x) exp(cos(x))-sin(x)+x^2;
h = @(x) log(x^2+2);
tol = 10^-7;
a = 0;
b = 2;
%run functions

%Function 1
[iter1 val1 err1 errat1] = bisect(f,a,b,tol);
[iter2 val2 err2 errat2] = nm(f,b,tol);
[iter3 val3 err3 errat3] = secant(f,a,b,tol);
%Function 2
[iter4 val4 err4 errat4] = bisect(matlabFunction(diff(sym(g),1)),a,b,tol);
[iter5 val5 err5 errat5] = nm(matlabFunction(diff(sym(g),1)),b,tol);
[iter6 val6 err6 errat6] = secant(matlabFunction(diff(sym(g),1)),a,b,tol);
%Function 3
[iter7 val7 err7 errat7] = bisect(matlabFunction(diff(sym(h),2)),a,b,tol);
[iter8 val8 err8 errat8] = nm(matlabFunction(diff(sym(h),2)),b,tol);
[iter9 val9 err9 errat9] = secant(matlabFunction(diff(sym(h),2)),a,b,tol);
%print nicely
fprintf("Final Project - Root Finding Methods\n")
%Function 1
fprintf("Roots of f(x) = x^2-3, tol = 1e-07\n\tBisection Method over [0,2]\n")
rootPrint(iter1,val1,err1,errat1)
fprintf("Newton's Method with initial guess 2\n")
rootPrint(iter2,val2,err2,errat2)
fprintf("Secant Method with guesses 0 & 2\n")
rootPrint(iter3,val3,err3,errat3)
%Function 2
fprintf("\n")
fprintf("Roots of g'(x), g(x) = exp(cos(x))-sin(x)+x^2, tol = 1e-07\n\tBisection Method over [0,2]\n")
rootPrint(iter4,val4,err4,errat4)
fprintf("Newton's Method with initial guess 2\n")
rootPrint(iter5,val5,err5,errat5)
fprintf("Secant Method with guesses 0 & 2\n")
rootPrint(iter6,val6,err6,errat6)
%Function 3
fprintf("Roots of h''(x), h(x) = ln(x^2+2), tol = 1e-07\n\tBisection Method over [0,2]\n")
rootPrint(iter7,val7,err7,errat7)
fprintf("Newton's Method with initial guess 2\n")
rootPrint(iter8,val8,err8,errat8)
fprintf("Secant Method with guesses 0 & 2\n")
rootPrint(iter9,val9,err9,errat9)
%Functions

% bisect() function:
% -take in a function, a tolerance, and 2 endpoint guesses
% -if the 2 are of opposie signs, continue with the function, otherwise
% return empty arrays and display an error message
% -run a while loop to keep running until the answer is within a certain
% tolerance (tol)
%   take the midpoint of the two endpoints, then figure out which endpoint
%   has the opposite sign as the new midpoint, whichever it is, keep as an
%   endpoint, and replace the old endpoint with the midpoint
%   repeat
% Once I have that, return the number of iterations it took, the array of
% values on each iteration, the error, and error ratios for all of them

%The bisection method seems to have the error slowly decrease, but
%sometimes it jumps to about 1/5 the error
function [iter val error errrat] = bisect(f,a,b,tol)
    %if the signs are the same, there is no guarantee that the function
    %hits 0 at any point
    m = 0;
    iter = []; val = []; error = []; errrat = [];
    if sign(f(a)) == sign(f(b))
        return
    end
    %find a mid point
    m = (a+b)/2;
    counter = 0;
    %while the mid point is not close enough to the root to be within the
    %tolerance, set a new midpoint, calculate the value, continue
    while abs(f(m)) > tol
        if sign(f(m)) == sign(f(a))
            a = m;
        else
            b = m;
        end
        counter = counter + 1;
        m = (a+b)/2;
        iter(counter) = counter;
        val(counter) = m;
    end
    for i=1:length(iter)
        error(i) = abs(val(i)-val(end));
    end
    for i = 1:length(iter)-1
        errrat(i) = error(i+1)/error(i);
    end
    errrat = [errrat 0];
end

%nm() function:
% -take in a function, a guess, and a tolerance
% -calculate the derivative of the function at the guess point
% -use the derivative to calculate x1 = x0 - (f(x0)/f'(x0))
% -keep on doing this until f(xn) is within the tolerance
% -return all of the same info as bisection (iterations, values, error,
% error ratio

%Newton's method error
function [iter val error errrat] = nm(f,x0,tol)
    f = sym(f);
    r = x0;
    counter = 0;
    iter = []; val = []; error = []; errrat = [];
    %loop until abs(f(x)) < tol
    while abs(double(subs(f,r))) > tol
        counter = counter + 1;
        %root = root - f(root)/f'(root)
        r = r - double(subs(f,r))/double(subs(diff(f),r));
        iter(counter) = counter;
        val(counter) = r;
    end
    for i=1:length(iter)
        error(i) = abs(val(i)-val(end));
    end
    for i = 1:length(iter)-1
        errrat(i) = error(i+1)/error(i);
    end
    errrat = [errrat 0];
end

%secant() function:
% -take in a function, a tolerance, and an x0 and x1
% -run the equation x2 = x1-f(x1)*((x1-x0/f(x1)-f(x0)) until f(x2) is
% within the tolerance
function [iter val error errrat] = secant(f,x0,x1,tol)
    counter = 1;
    iter = []; error = []; errrat = [];
    val(1) = x0;
    val(2) = x1;
    while abs(f(val(end))) > tol
        val = [val val(end-1)-f(val(end-1))*((val(end-1)-val(end))/(f(val(end-1))-f(val(end))))];
        counter = counter + 1;
        iter(counter-1) = counter-1;
    end
    val(1) = [];
    val(2) = [];
    for i=1:length(iter)
        error(i) = abs(val(i)-val(end));
    end
    for i = 1:length(iter)-1
        errrat(i) = error(i+1)/error(i);
    end
    errrat = [errrat 0];
end
%rootPrint() function: 
% -nicely print out all info given from one of the root finding methods
function rootPrint(iter,val,err,errat)
    fprintf("%10s %10s %10s %15s\n","Itr","Value","Err","ErrRatio")
    for i=1:length(iter)
        fprintf("%8d %15.8f %12.8f %12.8f\n",iter(i),val(i),err(i),errat(i))
    end
end