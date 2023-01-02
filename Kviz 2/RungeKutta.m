function [t,y] = RungeKutta(f,a,b,y0,h)
% function [t,y] = RungeKutta(f,a,b,y0,h)
%
% Funkcija RungeKutta izvede RK metodo, podano s shemo B. Vhodni podatki so
% funkcija f, interval [a,b], začetni približek y0 ter korak h. Funkcija
% nam vrne seznama t, v katerem so delilne točke, ter seznam y, v katerem
% so vrednosti y(n) pri delilni točki t(n).

n = (b-a)/h;

t = linspace(a,b,n+1);
y = y0;

B = [0 0 0 0 0 0 0;
    1/5 1/5 0 0 0 0 0;
    3/10 3/40 9/40 0 0 0 0;
    3/5 3/10 -9/10 6/5 0 0 0;
    1 -11/54 5/2 -70/27 35/27 0 0;
    7/8 1631/55296 175/512 575/13824 44275/110592 253/4096 0;
    0 37/378 0 250/621 125/594 0 512/1771;
    0 2825/27648 0 18575/48384 13525/55296 277/14336 1/4];

for i = 1:n
    k1 = f(t(i), y(i));
    k2 = f(t(i) + B(2,1)*h, y(i) + B(2,2)*k1*h);
    k3 = f(t(i) + B(3,1)*h, y(i) + (B(3,2)*k1 + B(3,3)*k2)*h);
    k4 = f(t(i) + B(4,1)*h, y(i) + (B(4,2)*k1 + B(4,3)*k2 + B(4,4)*k3)*h);
    k5 = f(t(i) + B(5,1)*h, y(i) + (B(5,2)*k1 + B(5,3)*k2 + B(5,4)*k3 + B(5,5)*k4)*h);
    k6 = f(t(i) + B(6,1)*h, y(i) + (B(6,2)*k1 + B(6,3)*k2 + B(6,4)*k3 + B(6,5)*k4 + B(6,6)*k5)*h);
    
    y(i+1) = y(i) + h*(B(7,2)*k1 + B(7,3)*k2 + B(7,4)*k3 + B(7,5)*k4 + B(7,6)*k5 + B(7,7)*k6);
end

end