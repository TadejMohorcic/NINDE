function [x,y,ytol,h] = CashKarp(f,a,b,y0,h0,tol)
% function [x,y,ytol,h] = CashKarp(f,a,b,y0,h0,tol)
%
% Funkcija CashKarp izvede RK metodo z adaptivnim korakom h za reševanje
% začetnih problemov y' = f(x,y). Vhodni podatki so funkcija f, interval
% [a,b], začetni približek y0, začetni korak h0 in toleranco tol. Funkcija
% nam vrne seznam x, ki vsebuje delilne točke x(n), seznama y in ytol, ki
% vsebujeta vrednosti y(n) in y~(n) pri delilnih točah iz seznama x, in
% seznam h, v katerem so koraki h(n).

q = 4;
i = 1;

x = a;
y = y0;
ytol = 0;
h = h0;

B = [0 0 0 0 0 0 0;
    1/5 1/5 0 0 0 0 0;
    3/10 3/40 9/40 0 0 0 0;
    3/5 3/10 -9/10 6/5 0 0 0;
    1 -11/54 5/2 -70/27 35/27 0 0;
    7/8 1631/55296 175/512 575/13824 44275/110592 253/4096 0;
    0 37/378 0 250/621 125/594 0 512/1771;
    0 2825/27648 0 18575/48384 13525/55296 277/14336 1/4];

while x(i) + h(i) <= b
    k1 = f(x(i), y(i));
    k2 = f(x(i) + B(2,1)*h(i), y(i) + B(2,2)*k1*h(i));
    k3 = f(x(i) + B(3,1)*h(i), y(i) + (B(3,2)*k1 + B(3,3)*k2)*h(i));
    k4 = f(x(i) + B(4,1)*h(i), y(i) + (B(4,2)*k1 + B(4,3)*k2 + B(4,4)*k3)*h(i));
    k5 = f(x(i) + B(5,1)*h(i), y(i) + (B(5,2)*k1 + B(5,3)*k2 + B(5,4)*k3 + B(5,5)*k4)*h(i));
    k6 = f(x(i) + B(6,1)*h(i), y(i) + (B(6,2)*k1 + B(6,3)*k2 + B(6,4)*k3 + B(6,5)*k4 + B(6,6)*k5)*h(i));
    
    y(i+1) = y(i) + h(i)*(B(7,2)*k1 + B(7,3)*k2 + B(7,4)*k3 + B(7,5)*k4 + B(7,6)*k5 + B(7,7)*k6);
    x(i+1) = x(i) + h(i);

    ytol(i+1) = y(i) + h(i)*(B(8,2)*k1 + B(8,3)*k2 + B(8,4)*k3 + B(8,5)*k4 + B(8,6)*k5 + B(8,7)*k6);
    
    tol2 = tol*max(abs(y(i+1)),abs(ytol(i+1)));
    err = abs(y(i+1) - ytol(i+1))/tol2;
    h(i+1) = h(i)*(1/err)^(1/(q+1));
    
    if x(i+1) + h(i+1) > b
        h(i+1) = b - x(i+1);
    end
    
    i = i + 1;
end

x(end) = [];
y(end) = [];
ytol(end) = [];
h(end) = [];

end