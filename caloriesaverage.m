% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE! 

function output = caloriesaverage(x)
% This function take one input - x
% and outputs the average of inputted calories.


% Creating two persistent variables to be updated or rest
persistent currentcals;
persistent counter;

% Checks to see if the input value x is 0 and if so
% resets both persistent variables and sets the output to 0
if x == 0
    output = 0;
    clear currentcals;
    clear counter;
    
%
else
    newcals = x;
    currentcals(end+1) = newcals;
    calcounter = sum(currentcals);
    counter(end+1) = 1;
    countersum = sum(counter);
    output = calcounter / countersum;
        
    % If output is over 2000, print that the user has reached the reccommended calorie
    % consumption for the day.
    if output > 2000
            
    fprintf('You have reached the recommended calorie consumption for one day')
    
    end
end
end
        