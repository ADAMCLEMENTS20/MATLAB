clear; close; clc;
%Author: Adam Clements
%Summary: plot covid cases in selected country (Spain), then use a
%quadratic and linear expression to predict the cases on July 4th 2021
%--------------------------------------------------------------------------
% February 1st 2020: Day 0
% July 4th 2021: Day 519
%load in data from my file
load Spain_Covid_Cases_MATLAB.txt
cases = Spain_Covid_Cases_MATLAB(:,2);
days = Spain_Covid_Cases_MATLAB(:,1);
x = linspace(0,519,1500);

%all math necessary was learned here:
%https://www.freetext.org/Introduction_to_Linear_Algebra/Basic_Applications_Linear_Algebra/Best_Fit/
%https://math.stackexchange.com/questions/267865/equations-for-quadratic-regression

%find the line of best fit 
[a b] = fitLine(days,cases);
lin = @(x) a.*x + b;

%find the quadratic of best fit
[a b c] = fitQuad(days,cases);
quad = @(x) a.*x.^2+b.*x+c;

%plot the line
subplot(2,1,1)
sgtitle('Covid Cases & Predictions for Spain from 02/01/20 to 07/04/2021')
hold on;
plot(days,cases,'b',"Linewidth",3)
plot(x,lin(x),'r:','LineWidth',3)
xlabel('Days since 02/01/2020')
ylabel('Cases')
title('Linear fit','FontWeight',"bold")
axis tight;
hold off;

%plot the quadratic
subplot(2,1,2)
hold on;
plot(days,cases,'b',"Linewidth",3)
plot(x,quad(x),'r:','LineWidth',3)
xlabel('Days since 02/01/2020')
ylabel('Cases')
title('Quadratic fit','FontWeight',"bold")
axis tight;
hold off;

%calculate values on July 4th and then print them out nicely
linValOnJul4 = lin(519);
quadValOnJul4 = quad(519);
fprintf("%25.25s: %4.0f cases on 07/04/2021\n","Linear Approximation",linValOnJul4)
fprintf("%25.25s: %4.0f cases on 07/04/2021","Quadratic Approximation",quadValOnJul4)

%functions
%(literal copy/paste of lab 2 (with minor tweaks))
function [a b] = fitLine(x,y)
    A = [ones([max(size(x)),1]) x];
    cd = rref([A'*A A'*y]);
    a = cd(2,3);
    b = cd(1,3);
end
%literal copy/paste of fitLine plus 1 column on A
function [a b c] = fitQuad(x,y)
    A = [ones([max(size(x)),1]) x x.^2];
    cd = rref([A'*A A'*y]);
    a = cd(3,4);
    b = cd(2,4);
    c = cd(1,4);
end