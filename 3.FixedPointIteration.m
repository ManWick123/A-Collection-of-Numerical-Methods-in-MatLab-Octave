close all
clear all
clc

  p0=2
  tol=10^(-3)
  I0=100  %put a big value
  f=@(x) x-sin(x)-1
  g=@(x) sin(x)+1
   
  
   %INPUT   
   %f -the function that the root is to be found   
   %g -is the Funtion given to take the iterations   
   %p0- the initial value   
   %tol - The tolerance    
   %I0 Number of iterations 
   
   disp('Fixed Point Iteration')   
   fprintf('The f(x)= ')   
   disp(f)   
   fprintf('The g(x)= ')   
   disp(g)   
   fprintf('The initial guess is %i \n',p0);   
   disp( 'n           p_n            f(p_n)') 
   
   i=1;
   
    while i<=I0
      %To subsitute the p0 value to f(x)     
      fp=feval(f,p0);     
      %Prints the no. of iteration, p and f(p) for each iteration.     
      fprintf( '%i \t %.10f \t %.10f \n', i-1, p0, fp) 
      
      %To subsitute the p0 value to g(x)      
      p=feval(g,p0);     
      if abs(p-p0)<tol       
        %Prints the root to the given tolerance      
        fprintf(' Approximation with tolerance %.15f is as follows \n', tol);        
        printf('\n Approximate solution  for p = %.8f \n\n',p);       
         return     
       endif 
       
       i=i+1;     
       p0=p; 
       
      endwhile     
      %Prints the error message if the number of iterations entered are not enough   
      %to achieve the given tolerance   
      fprintf( 'The method failed after I0 iterations, I0 = %i \n ', I0)  