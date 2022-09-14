clear; close; clc;
%Author: Adam Clements
%Summary: Take in data from a txt file, then ask the user for an id number,
%then output their grade data if the ID number is correct

%Pop CUlture References:
%729 (sum of aLL id Numbers): a movie
%149.24 (sum of final grade and lab total on ID 4): molar mass of
%Methamphetamene from Breaking Bad
%205 (sum of all grades for id 9): Ancient Humor
%300 (sum of all grades for ID 63): Number of spartans/ the movie 300
%272.77 (sum of all grades ID 28): Molar mass of Procaine Hydrochloride
%255 (sum of all grades ID 72): Place that the song Heart of Glass ranked
%on Rolling Stone top 500
%
%--------------------------------------------------------------------------
%variables
load id_lab_hw_projGrades.txt
gradeMat = id_lab_hw_projGrades;
%run functions
ID = GetID;
checkID(ID,gradeMat);
%functions
%take in an ID from the User
function ID = GetID
    ID = input("Please enter your ID to receive your grades: ");
end
%cehck if the user's input exists.
%if so, get the person's information and send the grades through to the
%next function
%otherwise, tell them their ID does not exist and exit
function checkID(ID,m)
    index = find(m(:,1)==ID);
    if ~isempty(index)
        fprintf("ID Found\n")
        grades = m(index,:);
        printGrades(grades)
    else
        fprintf("Your ID does not exist.")
    end
end
%if the grades did exist, send them through to this function
function printGrades(grades)
    %calculate the final grade
    finalGrade = (grades(2)*.35)+(grades(3)*.30)+(grades(4)*.35);
    %print out all of the grades nicely
    fprintf("%20.20s:%0.0f\n",'ID',grades(1))
    fprintf("%20.20s:%5.2f\n",'Homework',grades(3))
    fprintf("%20.20s:%5.2f\n",'Projects',grades(4))
    fprintf("%20.20s:%5.2f\n",'Labs',grades(2))
    fprintf("%20.20s:%5.2f\n",'Final Grade',finalGrade)
end