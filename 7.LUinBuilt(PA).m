close all
clear all
clc
%In built function for LU factorization
%WORKS WITH PARTIAL PIVOTING
%format rat
%format
A=[0 2 2;5 4 3;3 8 10]
%b=[16 26 -19 -34]'
[L,U,P] = lu(A)

%L - Lower triangular matrix
%U - Upper triangular matrix
%P - Permuation matrix

%C=[inverse(L)*P*b]; %from LC = pb
%X=[inverse(U)*C] %from UX = C