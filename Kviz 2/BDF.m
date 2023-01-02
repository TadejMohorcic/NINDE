function [x,y] = BDF(fun,L,D,y0,h)
% function [x,y] = BDF(fun,L,D,y0,h)
%
% Funkcija BDF izvede 3-člensko BDF metodo za reševanje začetnih
% problemov y' = f(t,y). Vhodni podatki so funkcija fun, interval [L,D],
% začetni približek y0 ter korak h. Funkcija vrne seznama x in y, prvi
% vsebuje delilne točke intervala [L,D], drugi pa vsebuje približke y(n)
% pri delilni točki x(n).

n = (D-L)/h;
x = linspace(L,D,n+1);

if length(y0) == 1
    y1 = ode45(fun,[L L+h],y0);
    y2 = ode45(fun,[L L+2*h],y0);
    y(1) = y0;
    y(2) = y1.y(end);
    y(3) = y2.y(end);
else
    y(1) = y0(1);
    y(2) = y0(2);
    y(3) = y0(3);
end

for i = 1:n-2
    yp = [y(i) y(i+1) y(i+2)];
    f = @(y) y - 18/11*yp(3) + 9/11*yp(2) - 2/11*yp(1) - 6/11*h*fun(x(i+2),y);
    z = fsolve(f,yp(2));
    y(i+3) = z;
end

end