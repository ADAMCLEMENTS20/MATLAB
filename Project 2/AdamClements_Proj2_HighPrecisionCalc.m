clear; close; clc;
%Author: Adam Clements
%Summary: Make a calculator that can multiply 2 10 digit numbers
%--------------------------------------------------------------------------
%take in 2 numbers
in1 = input('Enter in number 1:');
in2 = input('Enter in number 2:');
%turn the numbers into vectors
vec1 = vectorize(in1);
vec2 = vectorize(in2);
%find the absolute max length number that can come from this multiplication
%by multiplying the first numbers
maxlen = length(vectorize(vec1(1)*vec2(1)*10^(length(vec1)-1+length(vec2)-1)));
%multiply each number by each number in the vectors
total = 1;
for i=0:length(vec2)-1
    for j=0:length(vec1)-1
        multi = vec2(i+1)*vec1(j+1)*10^i*10^j;
        multiVec = vectorize(multi);
        multiVec = [zeros(1,maxlen-length(multiVec)) multiVec];
        multiArr(total,:) = multiVec;
        total = total+1;
    end
end
%now we have a massive array with the results of each piece of the
%multiplication
%add up the columns to get the answer vector
ansVec = sum(multiArr);
%run through the answer array and move all of the carried numbers to the
%left 1
%also, pad a 0 to the "beginning" of the answer vector, in case the carry
%goes over
ansVec = [fliplr(ansVec) 0];
for i=1:length(ansVec)-1
    %check if the number is greater than or equal to 10
    if ansVec(i) >= 10
        carry = floor(ansVec(i)/10);
        remain = mod(ansVec(i),10);
        ansVec(i) = remain;
        ansVec(i+1) = ansVec(i+1) + carry;
    end
end
ansVec = fliplr(ansVec);
%remove any possible remaining leading 0's
for i=1:length(ansVec)
    if ansVec(i) == 0
        ansVec(i) = [];
    else
        break
    end
end
%print results
fprintf("\nLab 6 - Multiplication\n 10-digit integer multiplier\n%20.0f\n*%19.0f\n---------------------\n",in1,in2)
%function prints a vector to appear as an int
printVecAsNum(ansVec)

%prints a vector to make it appear as a number
function printVecAsNum(x)
    for i=1:length(x)
        fprintf("%d",x(i))
    end
end

%Input: an int
%Output: a vector of that int
%ex: 1234 -> [1 2 3 4]
function out = vectorize(x)
    out = mod(floor(x./10.^(floor(log10(x)):-1:0)),10);
end