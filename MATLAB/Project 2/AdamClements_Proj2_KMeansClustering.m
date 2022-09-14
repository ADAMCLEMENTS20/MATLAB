clear; close; clc;
%Author: Adam Clements
%Summary: choose k random points and create clusters with the K means
%clustering algorithm
%--------------------------------------------------------------------------
k = 4;
load kMeansData.txt
x = kMeansData(:,1);
y = kMeansData(:,2);
[clusters, centers] = meanKs(kMeansData(:,1),kMeansData(:,2),k);
%plot the points and centers
colors = 'rgbmcy';
hold on
title(sprintf('K-means: %d Clusters',k))
xlabel('x')
ylabel('y')
%combine all data into 1 matrix
bigAMatrix = [x y clusters'];
%run through the data, and pull all xy sets that are in cluster i, then
%plot them
for i=1:k
    xInCluster = bigAMatrix(bigAMatrix(:,3) == i,1);
    yInCluster = bigAMatrix(bigAMatrix(:,3) == i,2);
    plot(xInCluster,yInCluster,'o','Color',colors(i))
    legendVec(i) = "Cluster " + i;
end
legendVec = [legendVec "Centers"];
%plot centers
for i=1:k
    center = plot(centers(i,1),centers(i,2),'o','Color','k');
end
%place the legend
legend(legendVec)
hold off

%THIS IS WHERE THE PLOTTING SCRIPT ENDS AND THE FUNCTION STARTS

function [clusterNums, centers]  = meanKs(x,y,k)
    N = length(x);
    %Randomly pick k centers
    idxs = randperm(N,k);
    %find those 3 values in the x/y vectors, and move them to their own
    %vectors
    centerX = x(idxs);
    centerY = y(idxs);
    %loop starts here
    oldIdxVec = zeros(1,length(x));
    matching = false;
    while matching == false
        %run the distance formula from each other point to the centers
        distances = zeros(length(x),k);
        for i=1:length(x)
            for j=1:k
                distances(i,j) = sqrt((centerX(j)-x(i))^2+(centerY(j)-y(i))^2);
            end
        end
        %assign the closest center point to each other point
        idxVec = zeros(1,max(size(distances)));
        for i=1:max(size(distances))
            [~,idx] = min(distances(i,:));
            idxVec(i) = idx;
        end
        %recalculate the center by making it the average location of all points in the cluster
        
        %separate out all of the x values and y values by cluster
        %look through the index vector and find all of the x-values linked
        %to the variable i
        for i=1:k
            %for loop will run k times, searching the idx vector for
            %i==closest center
            idxMatch = idxVec == i;
            %use the idxMatch vector to pull x and y values, sum them, and
            %then divide by the sum of idxMatch
            xVals = x(idxMatch);
            centerX(i) = sum(xVals)/sum(idxMatch);
            yVals = y(idxMatch);
            centerY(i) = sum(yVals)/sum(idxMatch);
        end
        %check if any points have switched cluster
        if oldIdxVec == idxVec
            matching = true;
        else 
            oldIdxVec = idxVec;
        end
    end
    %loop above until no data points switch cluster
    %return final values
    clusterNums = idxVec;
    centers = [centerX centerY];
end