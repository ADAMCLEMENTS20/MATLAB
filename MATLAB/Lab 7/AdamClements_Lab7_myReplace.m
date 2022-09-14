clear; close; clc;
%Author: Adam CLements
%Summary: Create a find & replace function
%--------------------------------------------------------------------------
%Variables
test1strIn = "WZaqbimbqZAbaigmpAAdbvAjociqybofbakbukjadAkbm.ajjo.?";
test1oldS = "bgmqjkAZ.";
test1newS = " rstlnehw";
test2strIn = 'bhNt$d7$y7u$mINn?$*f#icNn$7#$&u#7pINn$gwN227w?';
test2oldS = '$*bINg2&#7';
test2newS = ' AWeaslEro';
%run functions
test1strOut = myReplace(test1strIn,test1oldS,test1newS);
test2strOut = myReplace(test2strIn,test2oldS,test2newS);
%print
fprintf("Lab 7 - myReplace\nOriginal Message 1:\n\t%s\nAfter Replacement 1:\n\t%s\n\nOriginal Message 2:\n\t%s\nAfter Replacement 2:\n\t%s",test1strIn,test1strOut,test2strIn,test2strOut)
%functions
%-turn all of the strings into more usable char arrays
%-run through each letter in the string
%-run through each letter in the "letters to replace" char array
%-if the string character matches one of the letters to replace, it is
%replaced with the corresponding new letter, otherwise, it is not replaced
%return the new string
function strOut = myReplace(strIn,oldS,newS)
    strIn = char(strIn);
    oldS = char(oldS);
    newS = char(newS);
    strOut = [];
    for i=1:length(strIn)
        outed = false;
        for j=1:length(oldS)
            if strIn(i) == oldS(j)
                strOut = [strOut newS(j)];
                outed = true;
                break
            end
        end
        if outed == false
            strOut = [strOut strIn(i)];
        end
    end
end