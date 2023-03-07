% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!


function output = myevalueB(err)
    
    
e = exp(1);
n = 2;
syms k;
approx_value_e = vpa(symsum(1/factorial(k),k,[0 n]),5);


while 1

    if err > abs(e - approx_value_e)
        
        break
        
    end
    
    e;
    n = n + 1;
    approx_value_e = vpa(symsum(1/factorial(k),k,[0 n]),5);
end
output = n;
end

