clear; close; clc;
%Author: Adam Clements
%Summary: Make a function that can run newton's method on any function
%--------------------------------------------------------------------------
%variables
syms x
f = x^2-7;
g = sin(x) - 1/2;
h = log(x) - 1;
%call function
r1 = nm(f,2,10^-7);
r2 = nm(g,2,10^-7);
r3 = nm(h,2,10^-7);
%print results
fprintf("Lab 8 - Newton's Method\n")
fprintf("\tf(x) = x^2-7 has a root at approximately x=%0.7f\n",r1)
fprintf("\tg(x) = sin(x)-1/2 has a root at approximately x=%0.7f\n",r2)
fprintf("\th(x) = ln(x)-1 has a root at approximately x=%0.7f",r3)
%function
function r = nm(f,x0,tol)
    r = x0;
    %loop until abs(f(x)) < tol
    while abs(double(subs(f,r))) > tol
        %root = root - f(root)/f'(root)
        r = r - double(subs(f,r))/double(subs(diff(f),r));
    end
end