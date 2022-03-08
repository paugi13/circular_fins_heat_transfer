function [error] = error_calc(T, Taux)
%The error vector is returned

error(n+1,1);
for i = 1:(n+1)
    error(i) = abs(T(i)-Taux(i));
end

end

