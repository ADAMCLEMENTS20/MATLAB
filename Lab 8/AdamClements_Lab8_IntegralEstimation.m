clear; close; clc;
%Author: Adam Clements
%Summary: Write a script to use an interpolated integral in order to find a
%nestimated area for a curve
%--------------------------------------------------------------------------
%Variables
syms x
f = exp(-x^2)*cos(2*pi*x);
g = sqrt(1-x^4);
h = exp(exp(x));
%function calls
e1 = IntegralApprox(f,-2,1,36,6);
e2 = IntegralApprox(g,0,1,45,5);
electronicEntertainmentExpo = IntegralApprox(h,-1,1,60,5);
%print output
fprintf("Lab 8 - Integral Approximation\n")
fprintf("Integral of exp(-x^2)*cos(2*pi*x) over -2 to 1 is approx %0.8f\n",e1)
fprintf("Integral of sqrt(1-x^4) over 0 to 1 is approx %0.8f\n",e2)
fprintf("Integral of exp(exp(x)) over -1 to 1 is approx %0.8f",electronicEntertainmentExpo)
%functions
function e = IntegralApprox(f,a,b,N,M)
    runs = N/M;
    points = linspace(a,b,N+1);
    bounders = zeros(runs,M+1);
    bounders(1,1) = points(1);
    points(1) = [];
    for i=1:runs
        bounders(i,2:end) = points(1:M);
        if i~=runs
            bounders(i+1,1) = points(M);
        end
        points(1:M) = [];
    end
    e = 0;
    for i = 1:runs
        polyexp = polyfit(double(bounders(i,:)),double(subs(f,bounders(i,:))),M);
        polyexp = poly2sym(polyexp);
        e = e + double(int(polyexp,bounders(i,1),bounders(i,end)));
    end
    
end