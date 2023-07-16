clear all
close all
clc

A=[7 -2 1;14 -7 -3;-7 11 18]
%b=[1 1 1]'
 
  %A - co-efficient matrix
  %b - values on the right-hand side of the equation matrix
  
  %getting n: Number of Rows
  n = size(A,1);
  %produces the augmentd matrix_type
  %B = [A,b];
  %Assigning the original matrix
  K = [A];
  
  %Gaussian elimination process starts
  for i=1:n  
    for j = i+1:n
      m = A(j,i)/A(i,i);
      A(j,:) = A(j,:)-m.*A(i,:);
    endfor
    disp("")
    disp("gaussian elimination")
    disp("")
    m
    A
  endfor
  %Checking for solution
  if A(n,n) == 0.
    fprintf('No unique solution exists')
    return
  endif
  %U - Upper triangular matrix
  U=A
  %L - Lower triangular matrix
  L=K*inverse(U) % from A=LU
  Y=inverse(L)*b; %from LY=b (can also use backward substitution)
  
  %backward substitute
  R = [U,Y]; %Augmented matrix to obtain the last answers
  x = zeros(1,(size(R,2)-1));
  
  for i = n : -1:1
    b=0;
    for j=(i+1):n
      b=b+R(i,j)*x(j);
    endfor
    x(i) = (R(i,end)-b)/R(i,i);
  endfor
  fprintf('solution:%d \n',x)
