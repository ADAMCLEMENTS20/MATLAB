clear; close; clc;
%Author: Adam Clements
%Summary: Plot a parametric surface in 3D space
%Pop Culture reference: 720*730 = 525600 minutes in a year from "Seasons of
%Love" RENT
%--------------------------------------------------------------------------
%define functions
u = linspace(0,pi,720);
v = linspace(0,2*pi,730);
x = @(u,v) sin(u).^2.*cos(v.^2);
y = @(u,v) sin(u).*sin(3.*u).*sin(v.^2);
z = @(u,v) sin(u).*cos(2.*u);
%create the mesh
[U, V] = meshgrid(u,v);
X1 = x(U,V);
Y1 = y(U,V);
Z1 = z(U,V);
%plot
plot3(X1,Y1,Z1);