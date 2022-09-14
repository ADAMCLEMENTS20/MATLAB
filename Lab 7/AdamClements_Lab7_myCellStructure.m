clear;close;clc;
%Author: Adam Clements
%Summary: Create a cell array and print it nicely
%--------------------------------------------------------------------------
%escape rooms cell array inluding hte following info:
% Name, Difficulty, finished being built, escape rate, did I build it?
escapeRooms = {'Antidote 1',6.5/10,true,'60%',false;
    'Mansion Murder',9/10,true,'30%',false;
    'Lost City',7.5/10,true,'40%',true;
    'Under Pressure',9/10,true,'35%',false;
    'Budapest Express 1',8.5/10,true,'45%',false;
    'Mayday',8/10,true,'40%',false;
    'Scooby-Doo',7/10,true,'55%',false;
    'Who Stole Mona?',8/10,true,'40%',true;
    'Antidote 2',6.5/10,false,'N/A',true;
    'Th3 Cod3',7/10,false,'N/A',true;
    'Cuban Crisis',7/10,false,'N/A',true;
    'Budapest Express 2',8.5/10,false,'N/A',true};

%print it nicely
printCellArray(escapeRooms)
function printCellArray(arr)
    %Table Header
    fprintf("%20s %23s  %22s  %22s %23s\n",'Room Name','Difficulty','Built','Escape Rate','Built by Me')
    fprintf('--------------------------------------------------------------------------------------------------------------------\n')
    %run through each item in the table, make it into a astring, and print
    %it out
    for i=1:height(arr)
        for j=1:width(arr)
            fprintf("%20s\t",string(arr{i,j}))
        end
        fprintf('\n')
    end
end