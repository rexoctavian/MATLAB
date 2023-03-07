% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
 
% INSERT YOUR CODE HERE!

function [eigen_vectors, eigen_values] = myPCA(data)
    covmat = cov(data);
    [A, D] = eig(covmat);
    vals = diag(D);
    [~, ind] = sort(abs(vals),'descend');
    eigen_values = vals;
    eigen_vectors = A(:,ind);
end