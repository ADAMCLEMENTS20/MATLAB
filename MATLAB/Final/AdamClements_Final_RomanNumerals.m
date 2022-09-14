clear; close; clc;
%Author: Adam Clements
%Summary: Create a SINGLE function which converts numbers to roman
%numerals, and roman numerals to numbers
%--------------------------------------------------------------------------
%Variables
%Run Functions
out1 = romanNumeralConverter(1900);
out2 = romanNumeralConverter(649);
out3 = romanNumeralConverter(2568);
out4 = romanNumeralConverter("MDCCC");
out5 = romanNumeralConverter("MMDCCXXXVIII");
out6 = romanNumeralConverter("CCLV");
%Print Nicely
fprintf("Final Project - Roman Numeral Converter\n\n1900 is converted to %s\n649 is converted to %s\n2568 is converted to %s\n\nMDCCC is converted to %d\nMMDCCXXXVIII is converted to %d\nCCLV is converted to %d",out1,out2,out3,out4,out5,out6)
%Functions

%romanNumeralConverter Function
%-take in a char array or number
%-make sure the number is a char array or less than 4000 and greater than 0
%   

function numOut = romanNumeralConverter(numIn)
    %have a corresponding letter/number pair
    letters = ['I','X','C','M']
    letters2 = ['I','V','X','L','C','D','M'];
    vals = [1 5 10 50 100 500 1000];
    if isnumeric(numIn) && numIn < 4000
        numOut = [];
        numIn = flip(int2str(numIn));
        for i=1:length(numIn)
            %turn the number into a char array of the corresponding values
            numOut = [numOut repmat(letters(i),1,str2num(numIn(i)))];
        end
        numOut = flip(numOut)
        %special cases
        replacers = ["IIIIIIIII","IIIII","IIII","XXXXXXXXX","XXXXX","XXXX","CCCCCCCCC","CCCCC","CCCC"];
        replacees = ["IX","V","IV","XC","L","XL","CM","D","CD"];
        for i = 1:length(replacers)
            numOut = replace(numOut,replacers(i),replacees(i));
        end
        %turn the output char array back into a string
        numOut = convertCharsToStrings(numOut);
     elseif isstring(numIn)
         %variables
         numOut = 0;
         %turn the string input into a char array
         numIn = char(numIn);
         %run through all of the roman numerals, and if found, add them to
         %the numOut value
         for i=1:length(letters2)
             number = length(numIn(numIn == letters2(i)))*vals(i);
             numOut = numOut + number;
         end
    %if the input isn't numeric or a string, return an empty array
    else
        numOut = [];
    end
end