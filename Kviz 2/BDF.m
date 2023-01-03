function [x,y] = BDF(f,L,D,y0,h)
% function [x,y] = BDF(f,L,D,y0,h)
%
% Funkcija BDF izvede 3-člensko BDF metodo za reševanje začetnih
% problemov y' = f(x,y). Vhodni podatki so funkcija f, interval [L,D] na
% katerem rešujemo, približek y0 in korak h. Funkcija vrne seznam x, ki
% vsebuje delilne točke x(n) in seznam y, ki vsebuje vrednosti y(n) pri
% delilnih točkah iz seznama x.

n = (D-L)/h;

x = linspace(L,D,n+1);
y = y0;

if size(y0,2) == 1
    y1 = ode45(f,[L L+h], y0(:,1));
    y2 = ode45(f,[L L+2*h], y0(:,1));
    y(:,2) = y1.y(:,end);
    y(:,3) = y2.y(:,end);
end

for i = 1:n-2
    yp = y(:,[i i+1 i+2]);
    g = @(y) y - 18/11*yp(:,3) + 9/11*yp(:,2) - 2/11*yp(:,1) - 6/11*h*f(x(i+2),y);
    z = fsolve(g,yp(:,3));
    y(:,i+3) = z;
end

end