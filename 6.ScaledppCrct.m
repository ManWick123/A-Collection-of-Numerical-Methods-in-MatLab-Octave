clear all
close all
clc

  A =[0.0001 1 1;1 1 2]
  n = rows(A);
  S = zeros(1,n);
  NROW = zeros(1,n);
  for i = 1:n
    S(i) = max(abs(A(i,1:n)));
    if S(i) == 0
      disp('  No unique solution exists')
      return
    else
      NROW(i) = i;
    endif
  endfor
  
  for i = 1: n-1
    val = zeros(1,n-i+1);
    for j = i:n
      val(j) = abs(A(NROW(j),i))/S(NROW(j));
    endfor
    
    max_val = max(val);
    for p = i:n
      if abs(A(NROW(p),i))/S(NROW(p)) == max_val
        break
      endif
    endfor
    
    if A(NROW(p),i) == 0
        disp('  No unique solution exists')
        
       return
    endif
    if NROW(i) != NROW(p)
      NCOPY = NROW(i);
      NROW(i) = NROW(p);
      NROW(p) = NCOPY;
      
    endif
      
    for j = i+1:n
      m = A(NROW(j),i)/A(NROW(i),i);
      A(NROW(j),:) = A(NROW(j),:) - m*A(NROW(i),:);
    endfor
      
    %display ordered Augmented matrix
    Acorrect = [];
    for i = 1:n
      Acorrect(end+1,:) = A(NROW(i),:);
    endfor
    Acorrect
    
  endfor
  
  if A(NROW(n),n) == 0
    disp('')
    disp('  No unique solution exists')
    disp('')
    return
  endif
  x = zeros(1,n);
  x(n) = A(NROW(n), n+1)/ A(NROW(n),n);
  
  for k = n-1:-1:1
    sum1 = 0;
    for t = k+1:n
      sum1 += A(NROW(k),t)*x(t);
    endfor
    x(k) = (A(NROW(k),n+1) - sum1)/ A(NROW(k),k);
  endfor
  
  disp('')
  for h = 1:n
     fprintf('  x%.0f = %4.6f\n', h, x(h))
  endfor
  disp('')