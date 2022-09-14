clear; close; clc; format compact;
%Author: Adam Clements
%Summary: use a random number generator to find words in the given text
%file to fill in a MadLibs
%--------------------------------------------------------------------------

%get the file into a cell array format
file = fopen('wordsWithTypes.txt','rt');
words = textscan(file,'%s %s');
words{1} = convertCharsToStrings(words{1});
words{2} = convertCharsToStrings(words{2});
%^ this gives me a 1x2 cell array of cell arrays of the types, then the
%words
%{ {type} {word} }
%{ {type} {word} }
%{ ...    ...    }
%Variables
%"ING Ending Verb" "Adjective" "Noun" "Adjective" "Number" "THS Ending Noun" "Adjective" "ING Ending Verb" "SSES Ending Noun" "ING Ending Verb" "ING Ending Verb" "Noun Starting S" "Noun" "Adjective" "Adjective" "Noun" "VES Ending Noun" "Noun" "Noun"
inputVec = ["ING Ending Verb" "Adjective" "Noun" "Adjective" "Number" "THS Ending Noun" "Adjective" "ING Ending Verb" "SSES Ending Noun" "ING Ending Verb" "ING Ending Verb" "Noun Starting S" "Noun" "Adjective" "Adjective" "Noun" "VES Ending Noun" "Noun" "Noun"];
MadLibs = 'Getting started with (1) and making a game can prove to be a (2) task, so as an independent designer, here are some tips that can help you get a head start in the wide (3) of video game development. The (4) thing that can help you on your gaming journey is knowing the (5) simple role groups. Designers are responsible for the (6) and all the (7) stuff the player can do in their game, such as (8) a room that needs you to find multiple (9). Artists have it rough, working day in and day out (10) and (11) art assets and (12), and sometimes also work on creating (13)! Producers are the task managers, responsible for keeping a team (14), (15) and overseeing all other (16) of the game. Then there''s the programmers, who just sit at (17) and type fancy syntax (18) into a (19).';
newWords = [];
%decide what prefixes and suffixes are necessary for each word type, then
%send them into the findWord function
for i=1:length(inputVec)
    switch inputVec(i)
        case "Verb"
            out = findWord("Verb", "", "", words);
        case "Noun"
            out = findWord("Noun", "", "", words);
        case "Adjective"
            out = findWord("Adjective", "", "", words);
        case "Adverb"
            out = findWord("Adverb", "", "", words);
        case "Number"
            out = findWord("Number", "", "", words);
        case "ING Ending Verb"
            out = findWord("Verb", "", "ing", words);
        case "THS Ending Noun"
            out = findWord("Noun", "", "ths", words);
        case "SSES Ending Noun"
            out = findWord("Noun", "", "sses", words);
        case "Noun Starting S"
            out = findWord("Noun", "s", "", words);
        case "VES Ending Noun"
            out = findWord("Noun", "", "ves", words);
    end
    
    newWords = [newWords, out];
end
%run through the MadLibs char array, searching for the ( character, and
%replacing it with the given word from the newWords vector
for i = 1:length(inputVec)
    MadLibs = replace(MadLibs,sprintf('(%d)',i),newWords(i));
end
fprintf("Final Project - MadLibs\n%s",MadLibs)


%--------------------------------------------------------------------------
% -Run through all of the words in the word list, pulling words that match
% the part of speech and the "prefix" and "suffix"
% -Pick a random word from the vector of okWords, and return it
%--------------------------------------------------------------------------
function out = findWord(type, pre, suf, list)
    okWords = [];
    if type == "Number"
        out = num2str(floor(rand(1)*99));
        return
    end
    for i = 1:length(list{1})
        if lower(convertCharsToStrings(list{1}{i})) == lower(type) && (startsWith(list{2}{i},pre,"IgnoreCase",true) && endsWith(list{2}{i},suf,"IgnoreCase",true))
            okWords = [okWords convertCharsToStrings(list{2}{i})];
        end
    end
    out = upper(okWords(randi(length(okWords))));
end