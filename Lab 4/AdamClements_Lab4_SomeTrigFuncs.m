clear; close; clc;
%Author: Adam Clements
%Summary: Plot f(t) = sin((3/2)*t*exp(-cos t)) and g(t) = cos((3/2)*t*exp(sin t))
%-------------------------------------------------------------------------
hold on
%create my t values
t = linspace(0,3*pi/2);
%create the functions
f = @(t) sin((3/2).*t.*exp(-cos(t)));
g = @(t) cos((3/2).*t.*exp(sin(t)));
%plot axis
plot(linspace(0, 3*pi/2),linspace(0,0),'Color','k')
plot(linspace(0,0),linspace(-1,1),'Color','k')
grid on;
%plot the graph
y1 = f(t);
y2 = g(t);
plot(t,y1,'b',t,y2,'r','LineWidth',3);
xlim([0 3*pi/2])
ylim([-1 1])
%labels
xlabel('x')
ylabel('y')
title("Plots of some trig functions",'FontWeight',"bold")
%grid specs
xticks([0 pi/4 pi/2 3*pi/4 pi 5*pi/4, 3*pi/2])
xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2'})
grid minor;
