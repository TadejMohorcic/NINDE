function val = trapezoid2D(f,a,b,c,d,n,m)
% function val = trapezoid2D(f,a,b,c,d,n,m)
%
% Sestavljeno trapezno pravilo za računanje integralov dveh spremenljivk.
%
% Vhodni podatki
% funkcija f spremenljivk x in y,
% intervala [a,b] in [c,d],
% število delilnih točk n in m intervalov [a,b] in [c,d].
%
% Izhodni podatek
% približek za integral.

h1 = (b-a)/n;
h2 = (d-c)/m;

v = ones(1,n+1);
u = ones(1,m+1);
val = 0;

for i = 2:n
    v(i) = 2;
end
for i = 2:m
    u(i) = 2;
end

M = v'.*u;

for i = 1:n+1
    for j = 1:m+1
        val = val + M(i,j)*f(a+(i-1)*h1, c+(j-1)*h2);
    end
end

val = ((h1*h2)/4)*val;

end