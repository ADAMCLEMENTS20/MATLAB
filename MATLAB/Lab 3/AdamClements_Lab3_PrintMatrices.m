clear;clc;close;format compact;
%Author: Adam Clements
%Summary: Print an Nx2 matrix along with a name
%--------------------------------------------------------------------------
%Define matrices
m1 = randi([-10 10],3,2);
m2 = randi([-10 10],5,2);
m3 = randi([-10 10],8,2);
m4 = randi([-10 10],10,2);
%Run the functions
matrixPrintNby2(m1,'ronSwanson')
matrixPrintNby2(m2,'leslieKnope')
matrixPrintNby2(m3,'aprilLudgate')
matrixPrintNby2(m4,'andyDwyer')

%Testing area
%Create the function
function matrixPrintNby2(mat,name)
    row2type = floor((height(mat)+1)/2);
    a = mat(1:row2type-1,:);
    b = mat(row2type,:);
    c = mat(row2type+1:end,:);
    fprintf('             [%3.0f %3.0f]\n',a')
    fprintf('%12.12s=[%3.0f %3.0f]\n',name,b)
    fprintf('             [%3.0f %3.0f]\n',c')
    fprintf("\n\n")
end