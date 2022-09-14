clear;close;clc;
%Author: Adam Clements
%Summary: WRite a function to find the local mins and maxes of a function
%------------------------------------------------------------------------
%variables
syms x
f = x^5-(19/2)*x^4+(4/3)*x^3+124*x^2+96*x;
g = -exp(x) + 3*x;
h = -4*exp(x)+x*exp(x)+6*x-x^2;
%function calls
[min1, max1] = minMax(f);
[min2, max2] = minMax(g);
[min3, max3] = minMax(h);
%print results
fprintf("Lab 8 - Minimums and Maximums\n")
fprintf("For f(x) = x^5-(19/2)*x^4+(4/3)*x^3+124*x^2+96*x\n")
printMinMax(min1,max1)
fprintf("For g(x) = -exp(x) + 3*x\n")
printMinMax(min2,max2)
fprintf("For h(x) = -4*exp(x)+x*exp(x)+6*x-x^2\n")
printMinMax(min3,max3)
%functions
function [minX, maxX] = minMax(f)
    syms x
    minX = [];
    maxX = [];
    fprime = simplify(diff(f));
    zeros = double(solve(fprime == 0,x));
    for i = 1:length(zeros)
        lowZ = zeros(i)- .1;
        highZ = zeros(i) + .1;
        if double(subs(fprime,lowZ)) < 0 && double(subs(fprime,highZ)) > 0
            minX = [minX zeros(i)];
        elseif double(subs(fprime,lowZ)) > 0 && double(subs(fprime,highZ)) < 0
            maxX = [maxX zeros(i)];
        end
    end
end

function printMinMax(min,max)
    fprintf("\tLocal Mins: x=")
    for i = 1:length(min)
        fprintf("%2.4f, ",min(i))
    end
    fprintf("\b\b\n")
    fprintf("\tLocal Maxes: x=")
    for i = 1:length(max)
        fprintf("%2.4f,",max(i))
    end
    fprintf("\b\b\n")
end