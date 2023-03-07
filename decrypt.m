% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE! 

function output = decrypt(e, L, original_message)
%    
% Decrypt function that takes 3 arguments:
%
% e - 1 or 2, used to specify the type of encryption
% L - A positive integer used as the number of steps in the encryption
% message - The message to be decrypted

% Creating a list of all the letters in the alphabet
Alphabet = 'a':'z';

% Creating a string for the decrypted message to be added to
decrypted_message = '';

% Creating a variable and storing the length of the input message
len_message = strlength(original_message);

% Checking if e is = to 1
if e == 1

decrypted_message = original_message(1:L+1:end);

output = decrypted_message

% Checking if e is = to 2
elseif e == 2
    

for k = 1:len_message
        
        % Find the correspending index value for the letter to be
        % decrypted from the input message
        m = strfind(Alphabet, original_message(k));
        
        % Minus the step number (L) to the index value calculated above
        % and store it in a new index value
        y = m - L;
        
        % If the calculated index value is less than 0 add 26 to give the
        % impression of a roulette alphabet
        if y <= 0
        
            y = y + 26;
        end
        
        % Append the new decrypted letter to the decrypted message
        % string, after loop is complete this string will contain
        % the newly decrypted message
        decrypted_message = append(decrypted_message, Alphabet(y));
    end

output = decrypted_message

% if e is equal to anything else, give an invalid input error
else
    error('You have entered an invalid input value for e.  Valid inputs are the integers 1 or 2.')
end
end
