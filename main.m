%% Program to solve heat transfer problems in circular fins through finite difference method.
% In this case iterations are made using the Gauss - Seidel Method. 
% The circular fin in this problem is around a circular pipe carrying some gas. 

% Physical inputs.
% Adiabatic end is not assumed.

Rint = 1;
Rext = 2;
ef = 0.05;

lambda = 164;
Twall = 400;
Text = 300;
alpha_ext = 50; 
alpha_end = 50;

% Solver caractheristics

n = 100;
delta = 10^-6;
Tinic = 500;

%% Calculating coefficients ([W/K])
[ap,ae, aw, bp] = coefficient_calc(Rext,Rint,lambda,n);

%% Initiation
T = zeros(n+1,1);

for i =1:(n+1)
    T(i) = Tinic;    
end

boolean = 0;
while boolean == 0
    [T, Taux] = temp_field_calc(ap,ae, aw, bp, T);
    [error] = error_calc(T, Taux);
    if max(error) < delta
        boolean = 1;
    end
end




