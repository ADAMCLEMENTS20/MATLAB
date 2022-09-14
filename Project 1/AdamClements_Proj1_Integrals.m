clear; close; clc;
%Author: Adam Clements
%Summary: Use 3 different methods to calculate an integral
%-------------------------------------------------------------------------
%variables
f = @(x) exp(-x.^2);
%run functions
fprintf("Approximation to integral of e^(-x^2)\n")
integrate(f,11)
integrate(f,21)
integrate(f,41)
%functions
%Left Point Sum: Find all of the left points of rectangles, then add them
%all together
function fxdx = myLeftSum(f,n)
    points = linspace(0,1,n);
    leftsum = sum(f(points(1:end-1)));
    fxdx = (1/(n-1))*(leftsum);
end
%Trapezoidal method: do the same as the left points method, but average
%each point wit hthe rectangle from the right point
function fxdx = myTrap(f,n)
    points = linspace(0,1,n);
    trapsum = sum([f(points(1)) 2.*f(points(2:end-1)) f(points(end))]);
    fxdx = (1/(2*(n-1)))*(trapsum);
end
%Simpsons method: similar to the trapezoidal method, but draw quadratics
%between 3 points
%This one is a bit different because the equation for it requires some of
%the y values to be multiplied by 4 or 2, so I have separated the values
%out and then multiplied tehm before adding them
function fxdx = mySimp(f,n)
    points = linspace(0,1,n);
    ones = [points(1) points(end)];
    twos = [points(3:2:end-1)];
    fours = [points(2:2:end-1)];
    simpsum = sum([f(ones) 2.*f(twos) 4.*f(fours)]);
    fxdx = (1/(3*(n-1)))*(simpsum);
end
%integrate function
%This function wil integrate the function f down to n slices (theoretically
%works for any function and any number of slices)
function integrate(f,n)
    left = myLeftSum(f,n);
    trap = myTrap(f,n);
    simp = mySimp(f,n);
    fprintf(" For N=%2.0f\n",n)
    fprintf("%9.7s: %0.8f\n","L Sum",left);
    fprintf("%9.7s: %0.8f\n","Trap",trap);
    fprintf("%9.7s: %0.8f\n","Simp",simp);
end