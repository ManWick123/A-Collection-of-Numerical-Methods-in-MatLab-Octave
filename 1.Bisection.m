close all
clear all
clc

low=1.5
high=2
tol=10^(-2)
f=@(x) (x/2)^2-sin(x)

  %f-the function, low- a , high -b, tol- the accuracy 
  disp('Bisection Method');  
  %Checks the both ends of the interval 
  %Substitute the values to the function of x 
  y1 = feval(f, low); 
  y2 = feval(f, high); 
  %Counts the number of iterations 
  i = 0;  
 
  %Displays error and ends if signs are not different 
  if y1 * y2 > 0    
    disp('Have not found a change in sign. Will not continue...');    
    m = 'Error'    
    return 
  end  
  %Work with the limits modifying them until you find 
  %a function close enough to zero. 
  disp('n         a_n            b_n            p_n           f(p_n)'); 
  while (abs(high - low) >= tol)     
    i = i + 1;     
    %Find a new value to be tested as a root     
    m = (high + low)/2;     
    %Substitute the values to the function of x     
    y3 = feval(f, m);     
    if y3 == 0         
      fprintf('Root at x = %f \n\n', m);         
      return     
    end     
    fprintf('%2i \t %f \t %f \t %f \t %f \n', i-1, low, high, m, y3);        
    %Update the limits     
    if y1 * y3 > 0         
      low = m;         
      y1 = y3;     
    else         
      high = m;     
    end 
   end  
   %Show the last approximation considering the tolerance 
   w = feval(f, m); 
   fprintf('\n x = %f produces f(x) = %f \n %i iterations\n', m, y3, i-1,f); 
   fprintf(' Approximation with tolerance = %f \n', tol);
   
   n=((log(high-low))-(log(tol)))/(log(2))