% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
% 
% 
% Insert BELOW your code 

% INSERT YOUR CODE HERE!

function plotrandstem(doc, n)
    
text_doc = fopen(doc);
text_doc_scanned = fscanf(text_doc, '%s %f %s %f', [4 inf]);
points = text_doc_scanned';
fclose(text_doc);

if n > size(points, 1)
    error('Inputted n is greater than the number of points in inputted file')

elseif n == size(points, 1)
    x = points(:,2);
    y = points(:,4);
    stem(x,y);
    title(num2str(n) + "random data points");
    xlabel('x axis');
    ylabel('y axis');

else
    selected_points_index = zeros(1,n);
    
    for i = 1:n
        idx = randi(size(points, 1), 1);
        point_idx = find(selected_points_index == idx);
        
        while(~isempty(point_idx))
            idx = randi(size(points, 1), 1);
            point_idx = find(selected_points_index == idx);
        end
        
        selected_points_index(i) = idx;
        
    end
    
x = points(selected_points_index,2);
y = points(selected_points_index,4);
stem(x,y);
title(num2str(n)+ " random data points");
xlabel('x axis');
ylabel('y axis');
end

end