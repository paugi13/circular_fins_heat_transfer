function [ap,ae, aw, bp] = coefficient_calc(Rext,Rint,lambda,n, ef, alpha_ext, Text, alpha_end)
% Function to calculate all the coefficients through the fin.
% They are returned in vector format.

ap = zeros(n+1, 1);
aw = zeros(n+1, 1);
ae = zeros(n+1, 1);
bp = zeros(n+1, 1);

% Calculating coefficients ([W/K])
% Boundary counditions may be required for nodes on limits.

delta_r = (Rext-Rint)/n;

r_ac = 0;
for i=2:(n+1)
    
   %Now rP is modified to build the next node's coefficients.
   rP = r_ac + delta_r;
   
   rw = rP - delta_r/2;
   re = rP - delta_r/2;
   Sw = 2*pi*rw*ef;
   Se = 2*pi*re*ef;
   Ap = 2*pi*(re^2-rw^2);
   dpw = delta_r;
   dpe = delta_r;
   
   ap(i) = (lambda*Sw/dpw) + (lambda*Se/dpe) + alpha_ext*Ap;
   aw(i) = lambda*Sw/dpw;
   ae(i) = lambda*Se/dpe;
   bp(i) = alpha_ext*Text*Ap;
   
   if i == (n+1)
       ae(i)=0;
       Ap = 2*pi*(rP^2-rw^2);
       bp(i)= alpha_ext*Text*Ap + alpha_end*Text*2*pi*ef*Rext;
   end
end
end

