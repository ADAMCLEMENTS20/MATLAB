clear; close; clc;
%Author: Adam Clements
%Summary: figure out if a certain complex number is part of the mandelbrot set
%-----------------------------------------------------------------------------
%variables
N = 1024;
MAX = 10;
f = @(x) sin(x^2);
g = @(x) exp(x^5);
%make a double for loop that runs through ALL possible iterations of the
%NxN complex numbers
mandySet1 = Mandelbrotish(N,f,MAX);
mandySet2 = Mandelbrotish(N,g,MAX);
%make a 2x1 subplot
subplot(2,1,1)
sgtitle('Mandelbrot-ish Sets')
imagesc(mandySet1)
xticks(linspace(0,N,8))
xticklabels({'-2','-1.5','-1','-.5','0','.5','1','1.5'})
yticks(linspace(0,N,7))
yticklabels({'1.5','1','.5','0','-.5','-1','-1.5'})
xlabel('a')
ylabel('b')
title("f(z) = sin(z^2)")
subplot(2,1,2)
imagesc(mandySet2)
xticks(linspace(0,N,8))
xticklabels({'-2','-1.5','-1','-.5','0','.5','1','1.5'})
yticks(linspace(0,N,7))
yticklabels({'1.5','1','.5','0','-.5','-1','-1.5'})
xlabel('a')
ylabel('b')
title("f(z) = exp(z^5)")

function setOnesAndZeros = Mandelbrotish(N,f,MAX)
    setOnesAndZeros = ones(N);
    aDistPoints = linspace(-2,1.5,N);
    bDistPoints = linspace(-1.5,1.5,N);
    for i=1:N
        for j=1:N
            %iterate 20 times through
            c = complex(aDistPoints(i),bDistPoints(j));
            z = 0;
            for k=1:20
                %calculate z
                z = f(z) + c;
                %check if |z| is > MAX
                if abs(z)>MAX
                    setOnesAndZeros(i,j) = 0;
                    break
                end
                %if so, mark it as a 0 and break
                %if not, keep looping
            end
            %since I started with a matrix of ones, just don't do anything with
            %the value if it exits without breaking
        end
    end
end