clear; close; clc;
%Author: Adam Clements
% Summary: Write a program to show the maclaurin series for cosine
%--------------------------------------------------------------------------
%cos(x) = 1-(x^2/factorial(2))+(x^4/factorial(4))-(x^6/factorial(6))...
%set x
x = linspace(-3*pi,3*pi);

%start a loop to go 16 times (once for each subplot)
for n=1:16
    subplot(4,4,n)
    hold on
    sgtitle("Series Approximations for Cosine")
    %always plot the cosine graph
    plot(x,cos(x),'b')
    %if it is plot 1, do not run the mclaurin function as it is
    %unnecessary, just plot y=1
    if n > 1
        y = macLaurin(x,n);
        plot(x,y,'r:')
    else
        plot(x,linspace(1,1),'r:')
    end
    %set plot specifics
    xlim([-3*pi 3*pi])
    ylim([-1 1])
    title(sprintf('%d terms',n))
    xlabel('x')
    ylabel('y')
    xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
    xticklabels({'-3\pi' '-2\pi' '-\pi' '0' '\pi' '2\pi' '3\pi'})
    hold off
end

%functions
function out = macLaurin(x,n)
    %set out equal to 1.
    %when n is 1, do nothing
    %when n is 1, y = 1-(x^2/factorial(2))
    %when n is 2, y = 1-(x^4/factorial(4)
    f = @(x) 1;
    %for loop runs for how ever many terms there are
    for i=0:n-1
        if i > 0
            %if i is even, add, if odd, subtract
            if mod(i,2) == 1
                f = @(x) f(x) - (x.^(2*i)/(factorial(2*i)));
            else
                f = @(x) f(x) + (x.^(2*i)/(factorial(2*i)));
            end
        end
    end
    %return a vector of the y values that correspond to the mclaurin
    %series
    out = f(x);
end