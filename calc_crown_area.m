% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your function for exercise 2


% INSERT YOUR CODE HERE

function area_of_the_crown = calc_crown_area(r1, r2)
% This function calculates the area of a crown given two inputs
% The inputs can be either scalers or vectors.


    % Check to make sure that the inputted value(s) for r1 are less than those for r2
    % This is for scalars only
    
    if r1 > r2 & isscalar(r1) == 1 & isscalar(r2) == 1
        error('The inputted value for r1 is greater than the inputted value for r2 - Inner radius cannot be greater than outer radius')
    
    % Make sure if inputs are vectors, they are the same length
    
    elseif length(r1) ~= length(r2)
        error('The inputed vectors are not of the same length')

    % Check to see if input r1 is a vector or a scalar

    elseif isscalar(r1) == 0 & isvector(r1) == 0
        error('Input value r1 is neither a Vector or a Scaler')
        
    % Check to see if input r2 is a vector or a scalar

    elseif isscalar(r2) == 0 & isvector(r2) == 0
        error('Input value r2 is neither a Vector or a Scaler')
        
    % Check to make sure inputs are either both scalars or both vectors and if so calculate the area_of_the_crown
        
    elseif isscalar(r1) == 1 & isscalar(r2) == 1 || isvector(r1) == 1 & isvector(r2) == 1
        area_of_the_crown = pi*(r2.^2-r1.^2);
    
    % Output for an unexpected error or input occuring
        
    else
        error('Unexpected error occured')

    end

end