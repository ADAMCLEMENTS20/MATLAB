clear;close;clc;
switchwins = 0;
switchlosses = 0;
n = 10000;
for i=1:n
    doors = rand(3,1);
    car = max(doors);
    goats = sort(doors);
    goats = goats(1:2);
    selection = doors(ceil(3*rand));
    x = find(goats == selection);
    if ~isempty(x)
        goats(goats ~= selection) = [];
    else
        goats(goats == goats(ceil(2*rand))) = [];
    end
    if selection ~= car
        switchwins = switchwins + 1;
    else
        switchlosses = switchlosses + 1;
    end
    
end
fprintf("Total Runs: %f\n\nSwitch Wins: %f\n\nSwitch Losses: %f\n",n,switchwins,switchlosses)


