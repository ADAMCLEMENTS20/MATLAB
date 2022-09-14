clear; close; clc;
%Author: Adam Clements
%Summary: use addMultComp from the previous lab to subplot 5 graphs
%----------------------------------------------------------------------
%define x, f(x), and g(x)
x = linspace(-1,1,201);
f = @(x) exp(-x);
g = @(x) 4.*x.*cos(pi.*x).*sin(pi.*x);
%run addMultComp
[sum, prod, comp] = addMultComp(f,g);
%plots
%Subplot 1:
subplot('Position',[.06 .5725 .47 .38]);
y1 = f(x);
plot(x,y1,'b');
title('f(x)=e^{-x}');
xlabel('x');
ylabel('y');
grid on;
%Subplot 2:
subplot('Position',[.06 .07 .47 .38]);
y2 = g(x);
plot(x,y2,'b');
title('g(x)=4xcos(\pix)sin(\pix)');
xlabel('x');
ylabel('y');
grid on;
%Subplot 3:
subplot('Position',[.6 .72 .37 .23]);
y3 = sum(x);
plot(x,y3,'b');
title('f(x)+g(x)');
xlabel('x');
ylabel('y');
grid on;
%Subplot 4:
subplot('Position',[.6 .39 .37 .23]);
y4 = prod(x);
plot(x,y4,'b');
title('f(x)*g(x)');
xlabel('x');
ylabel('y');
grid on;
%Subplot 5:
subplot('Position',[.6 .07 .37 .23]);
y5 = comp(x);
plot(x,y5,'b');
title('f(g(x))');
xlabel('x');
ylabel('y');
grid on;


%addMultComp Function
function [sum, prod, comp] = addMultComp(f,g)
    %create the 3 functions
    sum = @(x) f(x)+g(x);
    prod = @(x) f(x).*g(x);
    comp = @(x) f(g(x));
end