%----------------------------------------------
% Summary: A script which creates checkboard 
%   patterns of either white or black pixels.
%  The function aBlur performs per-pixel blurring
%   and returns three NxN matrices, ud, lr and all
%   ud does "up down" blurring, lr does "left
%   right" blurring, and all averages the two.
%   The rest of the code prints out the orig
%   image along with each of the three blurred
%   images.
% Author: Driver script written by Dostert.
%
%----------------------------------------------

% Create checkerboards
cb = [checkerboard(1,32,32)>.5 checkerboard(2,16,16)>.5 checkerboard(4,8,8)>.5;...
    checkerboard(2,16,16)>.5 checkerboard(4,8,8)>.5 checkerboard(8,4,4)>.5;...
    checkerboard(4,8,8)>.5 checkerboard(8,4,4)>.5 checkerboard(16,2,2)>.5 ];
[N ~] = size(cb);
% Create a boarder around each section
cb(1:N/3:N,:) = 0;
cb(:,1:N/3:N) = 0;
% Convert the logical cb matrix to doubles
%  but still 0 and 1
cb = double(cb);
% This is the function you need to create
[ud, lr, all] = aBlur(cb);
% Plot em all
subplot(2,2,1)
imshow(cb); title('Original Image');
subplot(2,2,2)
imshow(ud); title('Up/Down Blurring');
subplot(2,2,3)
imshow(lr); title('Left/Right Blurring');
subplot(2,2,4)
imshow(all); title('Full Blurring');