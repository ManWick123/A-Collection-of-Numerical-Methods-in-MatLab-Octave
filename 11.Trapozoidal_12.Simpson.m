close all
clear all
clc

f=@(x) sqrt(x^2+1);
a=0;
b=2;

%area

h1=(b-a);
disp('trapezoidal rule')
T=(h1/2)*(f(a)+f(b))

disp(' ')
h2=(b-a)/2;
disp('simpson rule')
S=(h2/3)*(f(a)+4*f((a+b)/2)+f(b))