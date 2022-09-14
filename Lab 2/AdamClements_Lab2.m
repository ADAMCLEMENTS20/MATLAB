%Author: Adam Clements
%Summary: Repeated fraction multiplication and addition
%--------------------------------------------------------------
clear; clc; close;
%create the vectors for the values necessary, divide them, then take the:
%sum for 100
sum100 = (ones(1,100))/(cumsum([1:100]));
%product for 100
prod100 = prod(([1:100].^2)/([2:101].^2-1));
%sum for 1000
sum1000 = ones(1,1000)/cumsum([1:1000]);
%product for 1000
prod100 = prod(([1:1000].^2)/([2:1001].^2-1));

%print nicely
fprintf("Lab 2 - Product & Sum\nUsing 100 terms:\n")
fprintf("\t%0.4f = 1/1+1/3+1/6+1/10+1/15+1/21+...\n",sum100)
fprintf("\t%0.4f = 4/3*9/8*16/15*25/24*36/35...\n",prod100)
fprintf("Using 1000 terms:\n")
fprintf("\t%0.4f = 1/1+1/3+1/6+1/10+1/15+1/21+...\n",sum100)
fprintf("\t%0.4f = 4/3*9/8*16/15*25/24*36/35...\n\n\n",prod100)

pause;
clear;

%Summary: Use an ODE to solve for y values to approximate the equation
%which is the solution to the differential equation y''=xe^x

%set N to 1000
N = 1000;
%make x a vector of size N-1 linearly spaced between 0 and 1
x = linspace(0,1,N+1);
%remove the first and last values to account for 1 and 0
x(1) = []; x(end) = [];
%create a temporary vector to store the values on the diagonal
tempvec = zeros(1,N-1) - 2;
%make A a matrix with a diagonal line of -2's
A = diag(tempvec,0);
%re-set the tempvec to hold ones
tempvec = ones(1,N-2);
%make a the full tri-diagonal
A = A + diag(tempvec,1) + diag(tempvec,-1);
%calculate the vector b
b = x.*exp(x).*(x(2)-x(1))^2;
%subract 2 from the last element of b
b(end) = b(end)-2;
%solve for y values
y = b/A;
%graph to check
plot(x,x*exp(1)-2*exp(x)+x.*exp(x)+2,x,y,'r:','LineWidth',2);

fprintf("Lab 2 - an ODE\n\tSolution to y''=xe^x, y(0)=0, y(1)=2 is\n\txe-2e^x+xe^x+2\n\n\n")

pause;
close; clear;

%Summary: Calculate final grades for a math class
%Pop Culture reference: The numbers from Lost: 4 8 15 16 23 42

%set the vectors
HW = [4 8 1 5 1 6 2 3 4 2 10 9];
Exams = [92 65 70 80];
Final = 89;

%find the position of the minimum value in the vector
[m,p] = min(HW);
%get rid of whatever is in that position
HW(p) = [];
%do the same with exams, except replace instead of getting rid of
[m,p] = min(Exams);
Exams(p) = Final;
%calculate the final grade
grade = mean(HW)*10*.25+mean(Exams)*.5+Final*.25;

fprintf("Lab 2 - Math Grades\n\tYour class average is %0.2f\n\n\n",grade)

pause; clear;

%Summary: Find the line of best fit for the following x and y values
%all math necessary was learned here:
%https://www.freetext.org/Introduction_to_Linear_Algebra/Basic_Applications_Linear_Algebra/Best_Fit/
x = [0:4 6 8]; y = [3.50 1.25 -2.25 -1.75 -2.50 -6.50 -9.00];
%create the A vector
A = [1 1 1 1 1 1 1;0 1 2 3 4 6 8]';
%use what was on the website i looked at to solve down to just a c and a d
%value
cd = rref([A'*A A'*y']);
d = cd(1,3); c = cd(2,3);
fprintf("Lab 2 - Linear regression\n\t The line of best fit is y = %0.2fx + %0.2f\n\n\n",c,d)



