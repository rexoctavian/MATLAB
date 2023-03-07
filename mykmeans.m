% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
 
% INSERT YOUR CODE HERE!
function [C, V] = mykmeans(data, numCentroids)
    data = importdata(data);
    k = numCentroids;
    
    % Here we initialise the centroids to random points
    centroids = zeros(k, size(data, 2));
    randidx = randperm(size(data, 1));
    centroids = data(randidx(1:k), :);
    previous_centroids = centroids;
    
    % zeroed 1 column array of the same number of rows as the dataset
    % will be used to store which centroid each point is assigned to
    assignment = zeros(size(data, 1), 1);
    % Number of rows in the dataset tells us how many points there are
    num_points = size(data, 1);
    
    while true

        for i = 1:num_points
            % set the closest centroid as equal to the first centroid
            o = 1;
            % set distance from first centroid
            first_dist = pdist2(data(i,:), centroids(1,:));
            for j=2:k
                % compute distance to other centroids and if they are smaller
                % replace the closest distance
                second_dist = pdist2(data(i,:), centroids(j,:));
                if second_dist < first_dist
                    first_dist = second_dist;
                    % set the closest centroid to the new closest
                    o = j;
                end
            end
            % assign the closest centroid to the previously created one column
            % array such that by indexing the data set and the assignment
            % arrays you would get both the data point coordinates and the
            % closest centroid
            assignment(i) = o;
        end
    
        % m and n are the number of rows and columns of the dataset
        [m, n] = size(data);
        % reinitialise the centroids to 0
        centroids = zeros(k, n);
  
        for b=1:k
            % setting xi as a subset of the data where the centroid is equal
            % to the counter
            xi = data(assignment==b,:);
            %xi(1:3);
            % for each iteration ck is the number of datapoints assigned to
            % each centroid
            ck = size(xi,1);
            % updated centroids
            % -- 1/num of data points for that centroid multiplied by
            % the sum of all the points data points
            % i.e. the new centroids are placed at the mean of the group
            centroids(b, :) = (1/ck) * [sum(xi(:,1)) sum(xi(:,2))];
        end

        if isequal(previous_centroids, centroids)
            break
        end
        previous_centroids = centroids;
    end
    % V becomes the combined original datapoints with their assigned
    % centroids
    V = [data assignment];
    % Getting a colour for each clusters and assigning it to a group`
    palette = hsv(k);
    colours = palette(assignment,:);
    % plotting the clusters
    scatter(V(:,1), V(:,2), 15, colours, 'x');
    hold on
    %plotting the centroids
    plot(centroids(:,1), centroids(:,2), 'x', 'MarkerEdgeColor', 'k','MarkerSize', 10, 'LineWidth', 3);
    V = assignment;
    C = centroids;
end