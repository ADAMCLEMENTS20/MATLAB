%Pop Culture Reference: $339.88 from Groundhog Day

%Author: Adam Clements
%Summary: Approximate pi, aproximate factorials, savings bond, and triangle
%calculator
%-------------------------------------------------------------------
%Each formula should have at least two of the following:
%a root
%a log
%an exponential
%an integer power
% a factorial

clear;

%I found my approximations at 
%https://en.wikipedia.org/wiki/Approximations_of_%CF%80#:~:text=Depending%20on%20the%20purpose%20of,relative%20error%20of%20about%204&text=10%E2%88%924)%20and%20%E2%80%8B355,relative%20error%20of%20about%208&text=10%E2%88%928).

%I modified the formula of pi1 to include enough of the required formulae
%(In other words, I really wanted to do the stupid one with 10 square
%roots, but had to make it work)

fprintf("Lab 1 - Approximation of Pi \nMy approximations to pi are: \n")

%Approx 1
pi1 = (27.71247^2)*sqrt(2-sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+1)))))))));
fprintf("\t(27.7124^2)*sqrt(2-sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+sqrt(2+1))))))))) = %.17f \n",pi1)

%approx 2:
pi2 = log(640320^3 + 744)/sqrt(163);
fprintf("\t%56slog(640320^3 + 744)/sqrt(163) = %.17f \n",' ', pi2)

%MATLAB's pi
fprintf("\t%69sMATLAB pi approx = %.17f",' ',pi)

%from the looks of it, my approx 2 is the exact formula MATLAB actually
%uses for pi, becasue it should be 3.14159265358979*323* instead of 312
%(assuming I am remembering my pi correctly)

% -------------------------------------------------------------
% Lab 1 Pt 2
% Summary: use stirlings formula to approximate a factorial
% -------------------------------------------------------------
pause;
clear;

%use Stirlings formula to approximate n!
fprintf("Lab 1 - Stirling's Formula\n n! Calculator\n")
n = input(" Please enter an integer: ");
nfac = sqrt(2*pi*n)*(n/exp(1))^n;
fprintf("%3sStirling's approximation: %.30f\n %11sMATLAB's result: %.30f",' ',nfac,' ',factorial(n))

% -------------------------------------------------------------
% Lab 1 Pt 3
% Summary: calculate interest on a bond
% -------------------------------------------------------------
pause;
clear;

%100 dollars is compunded continuously for: 5 years, 15 years, and until it
%reaches $339.88 (What an oddly specific number)
%P1 = Pe^(r*t) r = AC = 4 = 4/5 = 0.8%
fprintf("Lab 1 - Bond, Grandma's Bond\n Starting at $100 at a rate of 0.8%%\n")
ten = 100*exp(.008*5);
twenty = 100*exp(.008*15);
%339.88 = 100*exp(.008*t)
%339.88/100 = exp(.008t)
%log(339.88/100)=.008t
%log(339.88/100)/.008)=t
age339 = log(339.88/100)/0.008;
fprintf("  When 10 years old: $%.2f\n",ten)
fprintf("  When 20 years old: $%.2f\n",twenty)
fprintf("  You will have $339.88 when you are %.0f years old\n",age339)

% -------------------------------------------------------------
% Lab 1 Pt 4
% Summary: calculate 1 side, 2 angles, and the area of a triangle, given an angle and
% 2 sides
% -------------------------------------------------------------
pause;
clear;

fprintf("Lab 1 - Triangle Calculator\n")
%side a = 8 in, side b = 9 in, angle C = input
a = 8;
b = 9;
C = input(" What is the angle (degrees) between sides a=8, and b=9? ");
%law of cosines
c = sqrt(a^2+b^2-2*a*b*cosd(C));
B = acosd((b^2-a^2-c^2)/(-2*a*c));
A = 180-B-C;
p = (a+b+c)/2;
%using the sign function to account for "possible" negative areas
area = sign(A)*sqrt(p*(p-a)*(p-b)*(p-c));
fprintf("%5sc = %.2f inches\n%5sB = %.2f degrees\n%5sA = %.2f degrees\n%2sarea = %.2f sq inches\n",' ',c,' ',B,' ',A,' ',area)