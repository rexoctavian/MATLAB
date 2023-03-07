% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!

function output = outpatientreport()

data = load('myhospital.mat');
Age = num2cell(data.Age);
Weight = num2cell(data.Weight);
isSmoker = num2cell(data.isSmoker);
myhospital = struct('LastName', data.LastName,...
                    'Sex', data.Sex,...
                    'Age', Age,...
                    'Weight', Weight,...
                    'isSmoker', isSmoker);
output = myhospital
end