clear; close; clc; format rational;
%Author: Adam Clements
% Summary: Write a program to take a vector and turn it into a continued
% fraction
%--------------------------------------------------------------------------
fib = fibSeq(20);
odds = 1:2:21;
piVec = piVector(15);


contFib = continuedFraction(fib);
contOdds = continuedFraction(odds);
contPi = continuedFraction(piVec);

fprintf("Lab 6 - Continued Fraction\n")
fprintf("Continued fraction made from\n")
fprintf(" ["); fprintf("%d ",odds); fprintf("\b]\n")
[num den] = rat(contOdds);
fprintf("is %d/%d\n\n",num,den)
fprintf("Continued fraction made from\n")
fprintf(" ["); fprintf("%d ",fib); fprintf("\b]\n")
[num den] = rat(contFib);
fprintf("is %d/%d\n\n",num,den)
fprintf("Continued fraction made from\n")
fprintf(" ["); fprintf("%d ",piVec); fprintf("\b]\n")
[num den] = rat(contPi);
fprintf("is %d/%d\n\n",num,den)

function out = continuedFraction(x)
    x = flip(x);
    prev = 1/x(1);
    for i=2:length(x)
        if i == length(x)
            prev =  (prev + x(i));
        else
            prev =  1/(prev + x(i));
        end
    end
    out = prev;
end

function out = fibSeq(x)
    out(1) = 1;
    out(2) = 1;
    for i=3:x
        out(i) = out(i-1) + out(i-2);
    end
end

function out = piVector(x)
    out = zeros(1,x);
    for i=0:x
        out(i+1) = floor(mod(pi*10^i,10));
    end
    out(end) = [];
end