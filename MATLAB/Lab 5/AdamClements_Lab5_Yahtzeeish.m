clear;close;clc;
%Author: Adam Clements
%Summary: Create a dice game where you:
%roll once, then pick which dice to hold
%then roll again and decide which dice to hold
%then roll 1 more time, and dispay their final roll
%--------------------------------------------------------------------------
%variables
%run functions
fprintf("Lab 5 - Yahtzee-ish\n")
dice = r1;
dice = r2(dice);
r3(dice);
%functions
%this function just gives a random set of 5 dice
function dice = r1
    dice = sort(randi([1 6],[1 5]));
    fprintf("Your dice are  %0.0f  %0.0f  %0.0f  %0.0f  %0.0f\n",dice)
end
%this function takes the previously rolled dice (d), and asks for indices
%to hold dice, then rolls len(d)-len(heldDice) more dice and combines them
%and sorts to give teh new 5 dice, and returns the new set of dice
function dice = r2(d)
    holdIndex = input("Which dice would you like to hold? (Enter indices as a vector):");
    heldDice = d(holdIndex);
    newDice = randi([1 6],[1 (max(size(d))-max(size(heldDice)))]);
    dice = sort([heldDice newDice]);
    fprintf("Your dice are  %0.0f  %0.0f  %0.0f  %0.0f  %0.0f\n",dice)
end
%this function takes in the previous dice roll, asks for indices, then just
%uses them to roll 1 more time. no output, becasue the dice are not rolled
%again
function r3(d)
    holdIndex = input("Which dice would you like to hold? (Enter indices as a vector):\n");
    heldDice = d(holdIndex);
    newDice = randi([1 6],[1 (max(size(d))-max(size(heldDice)))]);
    dice = sort([heldDice newDice]);
    fprintf("Your final dice are  %0.0f  %0.0f  %0.0f  %0.0f  %0.0f",dice)
end