% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your function for exercise 3


% INSERT YOUR CODE HERE

function flipped_vector = flipvector(input)
% A function that takes an input and performs the following actions:
% If input is a row vector, transform into a column vector
% If input is a column vector, transform into a row vector
% If input is a matrix or a scalar, output the input

    % Check to see if input is a row vector and if so, output the transformed column vector

    if isrow(input) == 1
        flipped_vector = input.';
        
    % Check to see if input is a column vector and if so, output the transformed row vector

    elseif iscolumn(input) == 1
        flipped_vector = input.';
        
    % Check to see if input is a matrix or a scalar and if so, output the input

    elseif (ismatrix(input) == 1 || isscalar(input) == 1)
        flipped_vector = input;

    % This will only output if the input in not a scalar, vector or matrix informing the user they have inputted an invalid option
    
    else
        error('Input is invalid')

    end

end