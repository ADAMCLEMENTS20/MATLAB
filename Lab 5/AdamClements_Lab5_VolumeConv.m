clear; close; clc;
%Author: Adam Clements
%Summary: Create a code which takes in a number and a unit and outputs the
%converted value
%--------------------------------------------------------------------------
%print nicely
fprintf("Lab 5 - Volume Conversions")
volIn = 0.0075708236;
volOut = volumeConv(volIn,'M','G');
fprintf("\n\t%0.8f cubic meter(s) is %0.8f gallon(s)",volIn,volOut)

volIn = 28.316847;
volOut = volumeConv(volIn,'L','F');
fprintf("\n\t%0.8f liter(s) is %0.8f cubic feet",volIn,volOut)

volIn = 2.1133764;
volOut = volumeConv(volIn,'G','L');
fprintf("\n\t%0.8f gallon(s) is %0.8f Liter(s)",volIn,volOut)

volIn = 247.20267;
volOut = volumeConv(volIn,'F','M');
fprintf("\n\t%0.8f cubic feet is %0.8f cubic meter(s)",volIn,volOut)

%functions
%volOut: Takes in 3 inputs
%volume: volume to be converted
%from: unit to be converted from
%to: unit to be converted to
%and returns 1 output
%volOut: volume converted to the new value
function volOut = volumeConv(volume, from, to)
    %if the unit being converted from is cubic meters, then check what it
    %is being converted to
    if from == 'M'
        %if it is cubic feet, then convert it
        %repeat for all possible combinations
        if to == 'F'
            volOut = volume*35.31466672;
        elseif to == 'L'
            volOut = volume*1000;
        elseif to == 'G'
            volOut = volume*264.17203728;
            %if the input is invalid, send an error message
        else
            volOut = [];
            fprintf("Your input was invalid. Please enter M,F,L, or G");
        end
    elseif from == 'F'
        if to == 'M'
            volOut = volume*0.02831684;
        elseif to == 'L'
            volOut = volume*28.31685000;
        elseif to == 'G'
            volOut = volume*7.48051995;
        else
            volOut = [];
            fprintf("Your input was invalid. Please enter M,F,L, or G")
        end
    elseif from == 'L'
        if to == 'F'
            volOut = volume*0.03531466;
        elseif to == 'M'
            volOut = volume*0.00100000;
        elseif to == 'G'
            volOut = volume*0.26417204;
        else
            volOut = [];
            fprintf("Your input was invalid. Please enter M,F,L, or G")
        end
    elseif from == 'G'
        if to == 'F'
            volOut = volume*0.13368055;
        elseif to == 'L'
            volOut = volume*3.78541200;
        elseif to == 'M'
            volOut = volume*0.00378541;
        else
            volOut = [];
            fprintf("Your input was invalid. Please enter M,F,L, or G")
        end
    else
        %if the input is invalid, send an error message
        volOut = [];
        fprintf("Your input was invalid. Please enter M,F,L, or G")
    end
end