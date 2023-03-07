% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
%  
% Insert BELOW your code 

% INSERT YOUR CODE HERE!

function Z = projectData(data, eigenvectors, k)
    U = eigenvectors;
    Z = [];
    Z = [Z, data*U(:,1:k)];
end

