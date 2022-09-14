clear; close; clc;
%Author: Adam Clements
%Summary: Create a script that takes in a string, and finds a PIN number
%that will decode the string
%-----------------------------------------------------------------------
%variables
testStr = '()8.G*8C.=B)CF?(.>;<*<B./';
%run functions
key = 0;
for i=10000:99999
    strOut = decode(testStr,i);
    isValid = checkStr(strOut);
    if isValid == true
        key = i;
        break
    end
end
fprintf("Lab 7 - Pin Decoding\nOrig Message:\n\t%s\nDecoded message with key %d:\n\t%s",testStr,key,strOut)

%output
%functions
%This function will take i na pin aand a char array, and subtract the PIN
%in sequence with the char a rray, then return a char array
function out = decode(strIn,pinIn)
    %turn the inputted char array into a vector of ASCII Values
    vecStr = double(strIn);
    %take the pin and turn it into a vector
    vecPin = num2str(pinIn);
    %turn the characters into their ASCII values
    vecPin = double(vecPin);
    for i=1:length(strIn)
        %run through the vector of doubles for the string input, and run
        %through the pin, subtracting the pin from the string
        modLen = mod(i,length(vecPin));
        if modLen == 0
            modLen = length(vecPin);
        end
        toRep = vecStr(i)+vecPin(modLen);
        %make sure the number is not greater than 127, or less than 0. if
        %so, make it land in the correct range
        if toRep < 0
            toRep = 127+toRep;
        end
        if toRep > 127
            toRep = toRep-127;
        end
        %replace the number in the string ASCII vector wit hthe new
        %calculated value
        vecStr(i) = toRep;
    end
    %turn the newly changed vector into a char array again
    out = char(vecStr);
end
function out = checkStr(in)
    out = false;
    %run through the newly created string, and check to see if '_want'
    %appears anywhere. if not, out is false, if so, out is true
    for i=1:length(in)-4
        if in(i) == '_' && in(i+1) == 'w' && in(i+2) == 'a' && in(i+3) == 'n' && in(i+4) == 't'
            out = true;
        end
    end
end