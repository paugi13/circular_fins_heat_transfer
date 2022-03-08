function [T, Taux] = temp_field_calc(ap,ae, aw, bp, T)
% Here the iteration is executed.
% The initial temperatures vector is stored in an auxiliar vector si the
% error can be calculated to decide if the results are good or not.

Taux = T;

for i = 1:(n+1)
    T(i) = (ae(i)*T(i+1) + aw(i)*T(i-1)+bp(i))/ap(i);
end

