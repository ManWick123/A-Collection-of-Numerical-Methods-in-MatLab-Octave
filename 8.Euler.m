clear all
close all
clc

a=0
b=1
y0=1
f=@(t,y) (t^3)*exp(-2*t)-2*y
g=@(t) ((exp(-2*t))/4)*(t^4+4)
%N=
  
  disp('Euler method') 
  
   %a- initial point 
   %b - y value given to find 
   %y0 - initial value given 
   %f is a ode f=@(x, y) x+y 
   %N - Number of steps 
   %f is a ode f=@(x, y) x+y 
   % g is the exact solution; 
   % y(i) is the approximated value 
   
   h=0.1 %(b-a)/N; 
   N=(b-a)/h;
   % to count the steps
   n=0; 
   t(1)=a ; 
   y=[zeros(1,N)]; 
   y(1)=y0; 
   i=1; 
   
   disp('n        ti        yi            gi            e' ) 
   
   e=abs(y(1)-g(t(1))); 
   fprintf('%i \t %i\t %.5f \t %.6f \t %.6f\n',n ,t(1),y(1),g(t(1)),e)  
   for i=1:N; 
      t(i+1)=t(i)+h; 
      k=f(t(i),y(i)); 
      y(i+1)=y(i)+h*k; 
      e(i)=abs(y(i+1)-g(t(i+1))); 
      n=n+1; 
      fprintf('%i \t %i\t %.5f \t %.6f \t  %.6f\n',n ,t(i+1),y(i+1),g(t(i+1)),e(i))
    end