clear; close; clc;
%Author: Adam Clements
%Summary: make a roller coaster with functions
%------------------------------------------------------------------------
%define my time parameter (from -pi to 9pi)
t = linspace(-pi,9*pi,201);
%functions for each line segment
%line segment 1
x1 = @(t) t;
y1 = @(t) t.*0;
z1 = @(t) cos(t);
%line segment 2
x2 = @(t) sin(t);
y2 = @(t) t-2*pi;
z2 = @(t) cos(t);
%line segment 3
x3 = @(t) -exp(cos(t))+exp(-1);
y3 = @(t) t-pi*4;
z3 = @(t) cos(t);
%line segment 4
x4 = @(t) (-pi/((-2*pi)^2))*(t-9*pi).^2;
y4 = @(t) (pi/(2*pi).^2)*(t-7*pi).^2;
z4 = @(t) cos(t);

%The rollercoaster may or may not crash into itself twice, which is what
%makes it so fun

%begin plotting
subplot(2,2,1);
hold on;
%plot the isometric view of the rollercoaster
%1:21 corresponds to the interval [-pi,0]
%61:121 corresponds to the interval [2pi,5pi]
%121:161 corresponds to the interval [5pi,7pi]
%161:201 corresponds to the interval [7pi,9pi]
plot3(x1(t(1:21)),y1(t(1:21)),z1(t(1:21)),'b','LineWidth',3)
plot3(x2(t(61:121)),y2(t(61:121)),z2(t(61:121)),'r','Linewidth',3)
plot3(x3(t(121:161)),y3(t(121:161)),z3(t(121:161)),'g','Linewidth',3)
plot3(x4(t(161:201)),y4(t(161:201)),z4(t(161:201)),'m','Linewidth',3)
%labels
xlabel('x')
ylabel('y')
zlabel('z')
title("Piecewise Rollercoaster (Isometric)")
view([45 45])
hold off;

%repeat for the rest of the view angles
subplot(2,2,2);
hold on;
plot3(x1(t(1:21)),y1(t(1:21)),z1(t(1:21)),'b','LineWidth',3)
plot3(x2(t(61:121)),y2(t(61:121)),z2(t(61:121)),'r','Linewidth',3)
plot3(x3(t(121:161)),y3(t(121:161)),z3(t(121:161)),'g','Linewidth',3)
plot3(x4(t(161:201)),y4(t(161:201)),z4(t(161:201)),'m','Linewidth',3)
xlabel('x')
ylabel('y')
zlabel('z')
title("Piecewise Rollercoaster (left side)")
view([0 0])
hold off;

subplot(2,2,3);
hold on;
plot3(x1(t(1:21)),y1(t(1:21)),z1(t(1:21)),'b','LineWidth',3)
plot3(x2(t(61:121)),y2(t(61:121)),z2(t(61:121)),'r','Linewidth',3)
plot3(x3(t(121:161)),y3(t(121:161)),z3(t(121:161)),'g','Linewidth',3)
plot3(x4(t(161:201)),y4(t(161:201)),z4(t(161:201)),'m','Linewidth',3)
xlabel('x')
ylabel('y')
zlabel('z')
title("Piecewise Rollercoaster (front)")
view([90 0])
hold off;

subplot(2,2,4);
hold on;
plot3(x1(t(1:21)),y1(t(1:21)),z1(t(1:21)),'b','LineWidth',3)
plot3(x2(t(61:121)),y2(t(61:121)),z2(t(61:121)),'r','Linewidth',3)
plot3(x3(t(121:161)),y3(t(121:161)),z3(t(121:161)),'g','Linewidth',3)
plot3(x4(t(161:201)),y4(t(161:201)),z4(t(161:201)),'m','Linewidth',3)
xlabel('x')
ylabel('y')
zlabel('z')
title("Piecewise Rollercoaster (top-down)")
view([90 90])
hold off;