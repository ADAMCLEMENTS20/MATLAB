clear; close; clc;
%Author: Adam Clements
%Summary: Create a function to take in x, and output the corresponding y
%for a piecewise function
%--------------------------------------------------------------------------
%variables
x = linspace(-4,4);
%function runs
y = aPiecewise(x);
%plots
hold on
%plot axes
plot([0 0],[min(y) max(y)],'k')
plot([min(x) max(x)],[0 0],'k')
%plot data
plot(x,y,'b','LineWidth',2)
%plot info
grid on
xlabel('x')
ylabel('y')
title('a Piecewise Function')
%functions

%takes in a vector (x) and checks which category each value lies in, then
%calculates its corresponding y value
function out = aPiecewise(x)
    out = zeros(1,length(x));
    for i=1:length(x)
        if x(i) < -2
            out(i) = abs(x(i)+2)-4;
        elseif x(i) <= 0
            out(i) = 4-2*x(i)^2;
        else
            out(i) = 4-sqrt(x(i));
        end
    end
end