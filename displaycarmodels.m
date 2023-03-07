% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE !

function output = displaycarmodels()

cardata = load('cardata.mat');
cardatatable = struct2table(cardata);

msg_one = "Choose number of cylinders";
msg_two = "Choose the model";

Cylinderoptions = string(unique(cardatatable.Cylinders));
choice_one = menu(msg_one, Cylinderoptions);

switch choice_one

    case 1
        T = (cardatatable.Cylinders == 3);
        U = cardatatable(T,:);

        Modeloptions = string(U.Model);
        choice_two = menu(msg_two, Modeloptions);
        
        V = U(:,{'Horsepower','Origin','Weight'});
        V(choice_two,:)

    case 2
        T = (cardatatable.Cylinders == 4);
        U = cardatatable(T,:);

        Modeloptions = string(U.Model);
        choice_two = menu(msg_two, Modeloptions);

        V = U(:,{'Horsepower','Origin','Weight'});
        V(choice_two,:)

    case 3
        T = (cardatatable.Cylinders == 5);
        U = cardatatable(T,:);

        Modeloptions = string(U.Model);
        choice_two = menu(msg_two, Modeloptions);

        V = U(:,{'Horsepower','Origin','Weight'});
        V(choice_two,:)

    case 4
        T = (cardatatable.Cylinders == 6);
        U = cardatatable(T,:);

        Modeloptions = string(U.Model);
        choice_two = menu(msg_two, Modeloptions);

        V = U(:,{'Horsepower','Origin','Weight'});
        V(choice_two,:)

    case 5
        T = (cardatatable.Cylinders == 8);
        U = cardatatable(T,:);

        Modeloptions = string(U.Model);
        choice_two = menu(msg_two, Modeloptions);

        V = U(:,{'Horsepower','Origin','Weight'});
        V(choice_two,:)

    otherwise
        error('There has been an unforeseen error')

end
end