clear; close; clc;
%Author: Adam Clements
%Summary: plot covid cases in selected country (Spain), then use a
%quadratic and linear expression to predict the cases on July 4th 2021
%--------------------------------------------------------------------------
% February 1st 2020: Day 0
% July 4th 2021: Day 519
%load in data from my file
load SpainLab.txt
cases = SpainLab(:,2);
days = SpainLab(:,1);
x = 1:1:520;
x2 = 1:1:458;

fprintf("Lab 8 - New Covid Est\n")

%plot the lines
sgtitle('Covid Cases & Predictions for Spain from 02/01/20 to 07/04/2021')
for i=1:4
    subplot(2,2,i)
    hold on
    plot(days,cases,'b','LineWidth',3)
    %create the best fit equation
    polynomeq = poly2sym(polyfit(days,cases,i));
    fplot(polynomeq,'r','LineWidth',3)
    xlabel('Days since 02/01/2020')
    ylabel('Cases')
    e = sqrt((sum((cases'-double(subs(polynomeq,x2))).^2))/458);
    title(sprintf('%d Deg Poly\nRMSE: %f',i,e))
    hold off
    fprintf("Estimate of cases on 7/4/2021 (Day 520)\n\tPoly of order %d is %d cases",i,subs(polynomeq,520))
end

