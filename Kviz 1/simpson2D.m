function val = simpson2D(f,a,b,c,d,n,m)
% function val = simpson2D(f,a,b,c,d,n,m)
%
% Sestavljeno Simpsonovo pravilo za računanje integralov dveh spremenljivk.
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

v = zeros(1,n+1);
u = zeros(1,m+1);
val = 0;

for i = 1:n+1
    v(i) = a + (i-1)*h1;
end
for i = 1:m+1
    u(i) = c + (i-1)*h2;
end

for i = 1:n
    for j = 1:m
        val = val + simpson2Dh(f,v(i),v(i+1),u(j),u(j+1));
    end
end

end

function val = simpson2Dh(f,a,b,c,d)
% function val = simpson2Dh(f,a,b,c,d)
%
% Pomožna funkcija, ki izračuna integral po Simpsonovem pravilu.
%
% Vhodni podatki
% funkcija f spremenljivk x in y,
% intervala [a,b] in [c,d].
%
% Izhodni podatek
% približek za integral.

e = (b-a)/2;
d = (d-c)/2;

v = [1 4 1];
M = v'.*v;
val = 0;

for i = 1:3
    for j = 1:3
        val = val + M(i,j)*(f(a+(i-1)*e, c + (j-1)*d));
    end
end

val = ((e*d)/9)*val;

end