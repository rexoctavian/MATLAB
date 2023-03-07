% CS 5810  -- Programming for data analysis 
%
%  Assignment 1 | Prof. Alberto Paccanaro
%
% 
% Insert BELOW your function for exercise 4


% INSERT YOUR CODE HERE


function return_even_odd = evenodd(n,e)
% A function that takes two inputs:
%
% n - a natural number
% e - a value in the set {1,2}
%
% and then:
%
% Creates a vector v of length n containing random integers in the range [0 .. 30]
%
% If e is 1, returns only the elements of v which have odd values and are placed at odd positions in v.
% If e is 2, return only the elements of v which have even values and are placed at even positions in v.

    % Creating vector of length n containing integers in the range 0 to 30

    v = randi([0,30],1,n);
    n_squared = n^2
    
    % Checks to make sure n is a natural number
    
    if rem(n,1) ~= n | sqrt(n_squared) ~= n
        error('You have not inputted a Natural number for n')
        
    % Checks to see if e is 1 and therefore looking for values in v that are both even and have an index that is also even

    elseif e == 1
        vectorodd = v(rem(v,2) == 1)
        vectoroddplaces = vectorodd(1:2:end);
        
    % Checks to see if e is 2 and therefore looking for values in v that are both odd and have an index that is also odd
    
    elseif e == 2
        vectoreven = v(rem(v,2) == 0)
        vectorevenplaces = vectoreven(2:2:end);
    
    % Deals with the case that either e is not inputted correctly (i.e. not 1 or 2)

    else
        error('You have an incorrect input')

    end

end