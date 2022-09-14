clear; close; clc;
%Author: Adam Clements
%Summary: create a functio nthat takes in 2 anonymous functions and returns
%3 functions: f(x)+g(x), f(x)g(x), f(g(x))
%--------------------------------------------------------------------------
%variables
f = @(x) x.^2;
g = @(x) cos(pi.*x);
x = [0:1/4:1];
%run the function
[sum prod comp] = addMultComp(f,g);
%calculate all values for the table
out1 = f(x);
out2 = g(x);
out3 = sum(x);
out4 = prod(x);
out5 = comp(x);
%print the table
fprintf('Lab 3 - Function Functions\n f(x) = x^2 and g(x) = cos(pi*x)\n')
printRow(x,'x')
printRow(out1,'f(x)')
printRow(out2,'g(x)')
printRow(out3,'f(x)+g(x)')
printRow(out4,'f(x)*g(x)')
printRow(out5,'f(g(x))')
%define the function
function [sum, prod, comp] = addMultComp(f,g)
    %create the 3 functions
    sum = @(x) f(x)+g(x);
    prod = @(x) f(x).*g(x);
    comp = @(x) f(g(x));
end
function printRow(x,funcName)
    fprintf('%11.11s: %5.2f %5.2f %5.2f %5.2f %5.2f\n',funcName, x(1), x(2), x(3), x(4), x(5))
end