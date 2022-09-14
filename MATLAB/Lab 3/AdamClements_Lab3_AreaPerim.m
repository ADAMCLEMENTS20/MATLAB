clear; clc; close;
%Author: Adam Clements
%Summary: Create a function which takes in 1 vector of 3 x points, and 1 of 3 y's and returns
%the area and perimeter of the triangle they create
%--------------------------------------------------------------------------
%test with the following points
%Point set 1:
x = [0 1 0];
y = [0 0 1];
AP = areaPermTri(x,y);
fprintf("Lab 3 - Triangle Area & Perimeter\n For a triangle with vertices\n\t(%0.0f,%0.0f) (%0.0f,%0.0f) (%0.0f,%0.0f)\nArea:%5.0s %0.2f\nPerimeter: %0.2f\n\n",x(1),y(1),x(2),y(2),x(3),y(3),' ',AP(1),AP(2))
%Point set 2:
x = [0 6 6];
y = [0 3 5];
AP = areaPermTri(x,y);
fprintf("For a triangle with vertices\n\t(%0.0f,%0.0f) (%0.0f,%0.0f) (%0.0f,%0.0f)\nArea:%5.0s %0.2f\nPerimeter: %0.2f\n\n",x(1),y(1),x(2),y(2),x(3),y(3),' ',AP(1),AP(2))
%Point set 3:
x = [5 3 2];
y = [5 2 6];
AP = areaPermTri(x,y);
fprintf("For a triangle with vertices\n\t(%0.0f,%0.0f) (%0.0f,%0.0f) (%0.0f,%0.0f)\nArea:%5.0s %0.2f\nPerimeter: %0.2f\n\n",x(1),y(1),x(2),y(2),x(3),y(3),' ',AP(1),AP(2))

%Function
function AP = areaPermTri(x,y)
    %turn the points into 1 vector
    points = [x' y'];
    %run distance formula for each x y pair
    distances = pdist(points);
    %calculate area and perimeter
    perim = sum(distances);
    p = perim/2;
    area = sqrt(p*(p-distances(1))*(p-distances(2))*(p-distances(3)));
    %return both in 1 vector
    AP = [area perim];
end