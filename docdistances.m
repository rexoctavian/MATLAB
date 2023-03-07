% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
% 
% 
% Insert BELOW your code 

% INSERT YOUR CODE HERE!

function docdistances
    % Store text names in a list
    texts = {'Cinderella.txt',... 
        'CAFA1.txt', ...
        'CAFA2.txt', ...
        'CAFA3.txt', ...
        'PrincessPea.txt', ...
        'RedRidingHood.txt'};
    
    % setting the tumber of texts into the variable n
    num_books = size(texts, 2);
    
    text_array = [];
    
    % Read in text files one by one and then put them into an array with
    % each word in its own cell
    % Then adds to an overall array containing two columns
    % The first has the name of the text
    % The second has a subarray containing all of the words of the text in
    % their own cells
    for i=1:num_books
        % book array
        array_by_word = textread(texts{i}, '%s', 'delimiter', ' ');
        % entire text array
        text_array{i} = [texts{i}, {array_by_word}];
    end
    
    % ---- TF VALUES ----
    % calculate the number of times each word appears and then divide it by
    % the total number of words
    
    % Create a table to store each word and the frequency that the word
    % appears in its own book, finally it stores the TF value for each word
    words_frequency_TF = cell2table(cell(0,3), 'VariableNames',["Word", "Frequency", "TF"]);
    for j=1:num_books
        % select each book 1 by one
        book = [text_array{j}{2}];
        % set the book title
        book_title = [text_array{j}{1}]
        % set the number of words in the book
        num_words = size(book, 1);
        % turn the book into a list of catagories
        catcal = categorical(book);
        W = categories(catcal);
        % Count the number of times a word appears in the text of the book
        F = countcats(catcal);
        % Compute the TF of each word
        TF = F ./ num_words;
        % Put all of the above into an array
        words_frequency = [W, num2cell(F), num2cell(TF)];
        % Turn this array into a table for easier later manipulation
        B = cell2table(words_frequency, 'VariableNames', ["Word", "Frequency", "TF"]);
        % Append each table to the end of the previous to keep all words in
        % one table.
        B = vertcat(words_frequency_TF,B);
        words_frequency_TF=B;
    end

    % ---- IDF VALUES ----
    word_idf = cell2table(cell(0,2), 'VariableNames',["Word", "idf"]);
    
    % Total number of words across all books
    total_num_words = size(words_frequency_TF,1);

    % Runs through each words across all documents
    idf = [];
    for k=1:total_num_words
        cou = 0;
        word = words_frequency_TF{k,1};
        for l=1:num_books
            % check each book for the apperance of each word
            book = [text_array{l}{2}];
            book_title = [text_array{l}{1}];
            matches = count(book, word);
            size(matches, 1);
            if  sum(matches) ~= 0
                word;
                book_title;
                cou = cou + 1;
            end
        end
        idf = log10((num_books / cou));
        word_idf_array = [word, idf];
        B1 = cell2table(word_idf_array, 'VariableNames',["Word", "idf"]);
        B1 = vertcat(word_idf, B1);
        word_idf = B1;
    end
    C = words_frequency_TF{:,3} * word_idf{:,2}.'
    C = pdist(C, 'cosine');
    full(C(1:6,1:6))
    IM = imagesc(C);
    map = colormap(gray);
end

    %{
    M = tfidf(bag);
    full(M(1:6,1:6))
    IM = imagesc(M);
    map = colormap(gray);
    %}