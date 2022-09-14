clear; close; clc;
%Author: Adam Clements
%Summary: Create a function to estimate the root of a function
%--------------------------------------------------------------------------
%create function handles
f = @(x) x^2-3;
g = @(t) cos(t/2);
h = @(theta) sin(theta/2)-exp(-theta);
k = @(x) abs(x^2-3*x+2);

fRoot = rootApprox(f,0,4,10e-6);
gRoot = rootApprox(g,0,4,10e-6);
hRoot = rootApprox(h,0,4,10e-6);
kRoot = rootApprox(k,0,4,10e-6);

fprintf('Lab 6 - Root Approx\n')
fprintf('A root of f(x)=x^2-3 between 0 & 4 is approx %0.6f\n',fRoot)
fprintf('A root of g(t)=cos(t/2) between 0 & 4 is approx %0.6f\n',gRoot)
fprintf('A root of h(theta)=sin(theta/2)-exp(-theta) between 0 & 4 is approx %0.6f\n',hRoot)
fprintf('A root of k(x)=abs(x^2-3*x+2) between 0 & 4 is approx %0.6f\n',kRoot)


%function takes in a function handle, 2 guesses at the range of a root ,and
%a tolerance for error
function out = rootApprox(f,a,b,tol)
    %if the signs are the same, there is no guarantee that the function
    %hits 0 at any point
    m = 0;
    if sign(f(a)) == sign(f(b))
        out = [];
        return
    end
    %find a mid point
    m = (a+b)/2;
    %while the mid point is not close enough to the root to be within the
    %tolerance, set a new midpoint, calculate the value, continue
    while abs(f(m)) > tol
        if sign(f(m)) == sign(f(a))
            a = m;
        else
            b = m;
        end
        m = (a+b)/2;
    end
    %return m/ the x value which most closely matches the root
    out = m;
end