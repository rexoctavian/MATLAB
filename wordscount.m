% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!

function output = wordscount(n)

text = fopen('TheTortoiseAndTheHare.txt');

text_lowercase = lower(fgetl(text));
text_to_cells = textscan(text_lowercase, '%s', 'Delimiter', ' ');
text_categorical = categorical(text_to_cells{:});

categories(text_categorical);

countcats(text_categorical);

fclose(text);

end