clear all
close all
clc

%f=@(x) (1+x)^(1/2);
x=[-2 1 3 7];
y=[5 7 11 34];
n=length(x)-1;

xp=5; %value which needs to find

sm=0;
for i=1:n+1
  pr=1;
  for j=1:n+1
    if j~=i
      pr=pr*(xp-x(j))/(x(i)-x(j));
    endif
  endfor
  sm=sm+y(i)*pr;
endfor
yp=sm

%Error=abs(f(0.45)-yp)