% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
% INSERT YOUR CODE HERE!


function output = myevalueA(err)
    
    
e_inverse = 1/exp(1);
n = 1;
approx_value_inv_e = (1 - (1/n)) ^ n;

while 1

    if err > abs(e_inverse - approx_value_inv_e)
        
        break
        
    end
    
    e_inverse;
    n = n + 1;
    approx_value_inv_e = (1-(1/n))^n;

end
output = n;
end

