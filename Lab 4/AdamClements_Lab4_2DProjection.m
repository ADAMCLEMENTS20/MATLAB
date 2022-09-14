clear; close; clc;
%Author: Adam Clements
%Summary: Plot a 2d line in 3d space, then view it from 2d to reveal 
%a projection
%--------------------------------------------------------------------------
%define functions
t = linspace(0,50,1000);
x = @(t) 3.*cos(t)+7.*cos(t./4);
y = @(t) 3.*sin(t)-7.*sin(t./4);
z = @(t) t+2.*t.*sin(t);
%calculate values
x1 = x(t);
y1 = y(t);
z1 = z(t);
%plot
%Subplot 1 (3D Space Curve):
subplot(2,1,1);
plot3(x1,y1,z1);
title('Space Curve')
xlabel('x')
ylabel('y')
zlabel('z')
grid on;
%Subplot 2 (2D Projection):
subplot(2,1,2);
plot3(x1,y1,z1);
title('2D Projection')
xlabel('x')
ylabel('y')
zlabel('z')
view([-90 90])
grid on;