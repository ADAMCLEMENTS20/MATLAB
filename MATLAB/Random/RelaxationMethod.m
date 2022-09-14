clear;close;clc
outvals = 30;
invals = 0;
startvals = 7;
tolerance = 0.0001;
map = zeros(12,14);
grid1 = setMap(map,outvals,invals,startvals)


function map = setMap(map,out,in,start)
    map(:,:) = start;
    map(:,1) = out;
    map(1,:) = out;
    map(12,:) = out;
    map(:,14) = out;
    map(6,7) = in;
    map(7,7) = in;
    map(7,8) = in;
    map(6,8) = in;
    return
end
function 