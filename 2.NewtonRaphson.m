close all
clear all
clc

  p0=5
  tol=10^(-3)
  I0=10
  f= @(x) (x^3)-(7*x^2)+(8*x)-3
  diff=@(x) 3*x^2-(14*x)+8
  %INPUTS   
  %f - the function that the root is to be found   
  %diff - Derivative of f(x)   
  %p0- the initial value   
  %tol - The tolerance    
  %I0 -  Number of iterations 
  
  disp('Newton- Raphson Method');
  
  fprintf('The f(x)= ')   
  disp(f);   
  fprintf('Initial guess as  %d \n\n', p0);   
  disp('n           p_n          f(p_n)   '); 
  
     i=0;     
     while i <= I0     
       %To subsitute the p0 value to f(x)      
       fp0 = feval(f, p0); 
       
       %Prints the no. of iteration, p and f(p) for each iteration.     
       fprintf( '%i \t %.10f \t %.10f \n', i , p0, fp0) 
       
       diffP0 = feval(diff , p0);     
       p = (p0 - (fp0/diffP0));
       
       if abs(p-p0)< tol     
         fprintf(' Approximation with tolerance %.10f is as follows \n', tol);           
         fprintf( 'The root is %.10f \n ', p) 
          %To print the last f(p) value at the given tolerance      
          fp=feval(f,p);      printf('f(p)= %.10f \n', fp);      
          return      
        endif
        
        i=i+1;      
        p0=p; 
       endwhile       
       fprintf( 'The number of iteration fails where I0 = %i',I0) 
