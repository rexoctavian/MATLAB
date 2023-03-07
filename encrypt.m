% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!

function output = encrypt(e, L, message)
%    
% Encrypt function that takes 3 arguments:
%
% e - 1 or 2, used to specify the type of encryption
% L - A positive integer used as the number of steps in the encryption
% message - The message to be encrypted

% Creating a list of all the letters in the alphabet
Alphabet = 'a':'z';

% Creating a string for the encrypted message to be added to
encrypted_message = '';

% Creating a variable and storing the length of the input message
len_message = strlength(message);

% Checking if e is = to 1
if e == 1
    
% Creating an empty string for random letters to be added to
random_letters = '';
    
    % For loop that runs for an amount of iterations equal to the length
    % of the input message, during each iteration it takes a character at
    % place j of the inputted message, and then appends the randomly
    % generated letters from the embedded for loop, it then adds each of
    % these individual parts to a whole, final encrypted messsage
    for j = 1:len_message-1
    
        % For loop that runs for an amount of iterations equal to the
        % integer L, during each iteration it generates a new random
        % letter and appends that letter to the random_letters string
        for i = 1:L
        
            % Creating a random number in the range 1 - 26
            a = randi([1 26]);
        
            % Using the random number created above to select a letter
            % in the alphabet and appending that letter to the previously
            % created random_letters string
            random_letters = append(random_letters, Alphabet(a));
            
        end
        
        % Creating a temporary variable to hold the current random
        % letters and selected message character
        encrypted_message_temp = append(message(j), random_letters);
        
        % Adding this temporary variable to the complete encrypted message
        encrypted_message = append(encrypted_message, encrypted_message_temp);
        
        % Resetting the random_letters string to allow for a fresh
        % set of characters
        random_letters = '';
        
    end

% Adding the last character to the message as this character has no
% random letters after it
encrypted_message = append(encrypted_message, message(len_message));

% Outputting the final encrypted message
output = encrypted_message

% Checking if e is = to 2
elseif e == 2
    
    % For loop that runs for an amount of iterations equal to the
    % length of the inputted message.
    for k = 1:len_message
        
        % Find the correspending index value for the letter to be
        % encrypted from the input message
        m = strfind(Alphabet, message(k));
        
        % Add the step number (L) to the index value calculated above
        % and store it in a new index value
        y = m + L;
        
        % If the index value generated above is greater than or equal to
        % 26 then subtract 26.  This gives the impression of a roulette
        % alphabet
        if y >= 26
        
            y = y - 26;
        end
        
        % Append the new encrypted letter to the encrypted message
        % string, after loop is complete this string will contain
        % the newly encrypted message
        encrypted_message = append(encrypted_message, Alphabet(y));
    end

% Output the final encrypted message
output = encrypted_message
    
    

% if e is equal to anything else, give an invalid input error
else
    error('You have entered an invalid input value for e.  Valid inputs are the integers 1 or 2.')
end
end
