%% Program to solve heat transfer problems in circular fins through finite difference method.
% In this case iterations are made using the Gauss - Seidel Method. 
% The circular fin in this problem is around a circular pipe carrying some gas. 

% Physical inputs.
% Adiabatic end is not assumed.
clc
clear; close all;
Rint = 1;
Rext = 2;
ef = 0.05;

lambda = 70;
Twall = 400;
Text = 200;
alpha_ext = 100; 
alpha_end = 100;

% Solver caractheristics

n = 100;
delta = 10^-6;
Tinic = 700;

%% Calculating coefficients ([W/K])
[ap,ae, aw, bp, node] = coefficient_calc(Rext,Rint,lambda,n, ef, alpha_ext, Text, alpha_end, Twall);
[P,R] = matrix_elements(ap,ae, aw, bp, n);


%% Initiation
[T] = temp_field_calc(P, R, n);

figure
plot(node, T, 'r');
xlabel('r [m]');
ylabel('T [K]');
title('Temperature along the circular fin');
grid on

