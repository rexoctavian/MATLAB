% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
% 
% 
% Insert BELOW your code 

% INSERT YOUR CODE HERE!

function [Xmu, mu] = subtractMean(data)
    mu = mean(data);
    Xmu = data - mu;
end