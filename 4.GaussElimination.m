clear all
close all
clc

  %A = Augmented Matrix   
   A=[1 0 0;-5 2 0] 
   %number of rows 
   n=size(A,1);
  
   for i=1:n-1   
     %diagonal element of matrix must not be 0   
     if A(i,i) ==0      
       fprintf(' Cannot procede with Gauss Elimination Method ')     
       return   
     endif   
     %the row operations  
     for j=i+1:n    
       m = A(j,i)/A(i,i);    
       A(j,:)=A(j,:)-m.*A(i,:);  
     endfor 
     m
     A
    endfor 
    
    %to check whether solutions exists  
    if A(n,n) ==0.    
      fprintf('No unique solution exists')     
      return  
    endif  
    %Backward substitution
    
    x =zeros(1,(size(A,2)-1));
    
    for i = n : -1:1     
      b=0;   
      for j=(i+1):n     
        b=b+A(i,j)*x(j);   
      endfor 
      %substitution  of values to the equations and solving.     
      x(i)= (A(i,end)-b)/A(i,i); 
     endfor 
     
     fprintf('Solution:%.7f \n',x)