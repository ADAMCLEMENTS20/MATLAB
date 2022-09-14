clear; close; clc;
%Author: Adam Clements
%Summary: solve optimization problems given f(x,y), g(x,y), and bounds a,b
%-------------------------------------------------------------------------
%variables
%functions for first problem
f1 = @(x,y) y.*x;
g1 = @(x,y) (x^2/9)+y^2 - 1;
%functions for second problem
f2 = @(x,y) x^2 + 4*x*y;
g2 = @(x,y) x^2*y-1728;
%--------------------------------------------------------------------------
%run functions
%maximize problem 1
[min1 max1] = optimization(f1,g1,-3,3);
%maximize problem 2
[min2 max2] = optimization(f2,g2,-inf,inf);
%--------------------------------------------------------------------------
%Print nicely
fprintf("Final Project - Optimization Solver\n")
%print problem 1
fprintf("Problem Statement:\n A rectangle is to be inscribed in the ellipse (x^2/9)+y^2=1.\n Find the largest such rectangle as well as the max area.\nMax of f(x,y)=x*y subject to (x^2/9)+y^2 - 1 = 0 where -3 <= x <= 3\n The max area is %f units at (%f,%f)\n\n",f1(max1(1),max1(2)),max1(1),max1(2))
%print problem 2
fprintf("Problem Statement:\n A rectangle box with a square base, open top, and volume of 1728 in^3 is to be constructed. Find the dimensions of a box that minimize the surface area\nMin of f(x,y)=4xy*x^2 subject to x^2*y=1728 where -infinity <= x <= infinity \n The min surface area is %f in^2 at (%f,%f)\n",f2(min2(1),min2(2)),min2(1),min2(2))
%--------------------------------------------------------------------------
%functions

%Optimization function:
%- take in the two functions
%- solve g(x,y) for y
%- plug that new equation solved for y into f(x,y)
%- differentiate that new function
%- solve for zeros
%- look through the zeros for 1 minimum anbd 1 maximum
%- return the x,y of the first minimum and the x,y of the first maximum
function [minOut, maxOut] = optimization(f,g,a,b)
    %- take in the two functions
    syms x y
    g = sym(g);
    %- solve g(x,y) for y
    g = solve(g == 0,y);
    f = sym(f);
    %- plug that new equation solved for y into f(x,y)
    newFunc = simplify(subs(f,y,g));
    newFunc = simplify(newFunc(end));
    %- differentiate that new function
    newFuncPrime = simplify(diff(newFunc,1));
    newFuncPrime = newFuncPrime(end);
    %- solve for zeros
    xVal = double(solve(newFuncPrime == 0,x,"Real",true));
    %remove values less than the minimum, and greater than the maximum
    xVal = double(xVal(xVal >= 0 & xVal <= b));
    minOut = zeros(1,2);
    maxOut = zeros(1,2);
    maxFilled = false;
    minFilled = false;
    %- look through the zeros for 1 minimum anbd 1 maximum
    %- return the x,y of the first minimum and the x,y of the first maximum
    for i = 1:length(xVal)
        if (double(subs(newFuncPrime,x,(xVal(i)-0.001))) > 0) && (double(subs(newFuncPrime,x,(xVal(i)+0.001))) < 0) && maxFilled == false
            maxOut(1) = xVal(i);
            maxOut(2) = double(subs(newFunc,x,xVal(i)));
            maxFilled = true;
        elseif (double(subs(newFuncPrime,x,(xVal(i)-0.01))) < 0) && (double(subs(newFuncPrime,x,(xVal(i)+0.01)))) > 0 && minFilled == false
            minOut = [xVal(i) double(subs(g,x,xVal(i)))];
            minFilled = true;
        end
    end
end