% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
%  
%
% 
% Insert BELOW your code 

% INSERT YOUR CODE HERE!

function myplots(inp_function, colours, markers)
    
    %% Example inputs:
    % inp_function = {'sin', 'sinh', 'cos', 'cosh'}
    % colours = ['b', 'r', 'k', 'g']
    % markers = ['o', 'x', 's', '*']

    % Check to ensure that the inputs are within the given sets
    
    % Sets outlined in the document
    function_set = {'sin','cos','tan','sinh','cosh','tanh'};
    colour_set = ['k','m','c','r','g','b'];
    marker_set = ['+','o','*','x','s','p'];
    
    % Check if inp_function is a member of the function_set
    if ~isempty(setdiff(inp_function,function_set))
        error('Inputted functions are not within the function set');
    end
    
    % Check if colours is a member of the colour_set
    if ~isempty(setdiff(colours, colour_set))
        error('Inputted colours are not within the function set');
    end
    
    % Check if markers is a member of the market_set
    if ~isempty(setdiff(markers, marker_set))
        error('Inputted markers are not within the function set');
    end
    
    
    % Error check for if input vectors have a length different than 4
    if any([length(inp_function) ~= 4,...
            length(colours) ~= 4,...
            length(markers) ~= 4])
        error('The length of each input must equal 4');
    end

    % Setting x to ensure that all functions are plotted in the interval
    % [-2pi, 2pi] with a step of 0.3
    x = -2 * pi:0.3:2 * pi;

    % Converting the inp_function from strings to MATLAB functions
    % Using str2func ensures that the input is actually a function
    % This stops any issues when running
    % We don't use evaluate function as it is depreciated by MATLAB
    function_1 = str2func(inp_function{1});
    function_2 = str2func(inp_function{2});
    function_3 = str2func(inp_function{3});
    function_4 = str2func(inp_function{4});

    % Plotting the results
    figure
    subplot(2, 2, 1), 
    plot(x, function_1(x), [colours(1) markers(1) '-']), title([inp_function{1} '(x)'])
    subplot(2, 2, 2), 
    plot(x, function_2(x), [colours(2) markers(2) '-']), title([inp_function{2} '(x)'])
    subplot(2, 2, 3), 
    plot(x, function_3(x), [colours(3) markers(3) '-']), title([inp_function{3} '(x)'])
    subplot(2, 2, 4), 
    plot(x, function_4(x), [colours(4) markers(4) '-']), title([inp_function{4} '(x)'])

end