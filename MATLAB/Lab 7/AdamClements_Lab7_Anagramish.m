clear;close;clc;
%Author: Adam Clements
%Summary: Find all english words that have the letters aiouegrwc
%--------------------------------------------------------------------------
%variables
contLetters = 'aiouegrwc';
%import a dictionary
load allWordsS.mat

validWords = [];
%check if all of the word's letters exist within the contLetters char array
for i=1:length(allWordsS)
    currentWord = char(allWordsS(i));
    %use ismember, then check if the sum of the resulting array is the length
    %of the input, meaning the tall of the letters appear
    binaryChar = ismember(currentWord,contLetters);
    %if the word is 5 letters long, and all of the letters appear in the
    %contLetters char array
    if sum(binaryChar) == length(currentWord) && sum(binaryChar) == 5 && (currentWord(1) == 'a' || currentWord(1) == 'w' || currentWord(1) == 'c')
        validWords = [validWords allWordsS(i)];
    end
end
validWords = sort(validWords);
%print values
fprintf("Lab 7 - Anagramish\nWords starting with AWC and containing letters aiouegr\n")
for i=1:length(validWords)
    disp(validWords(i))
end

