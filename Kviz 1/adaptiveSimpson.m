function [val, maxlvl] = adaptiveSimpson(f, a, b, tol)
% function [val, maxLevel] = adaptiveSimpson(f,a,b,tol)
%
% Rekurzivna adaptivna metoda za \int_a^b f(x) dx, ki temelji na
% Simpsonovem pravilu in Richardsonovi ekstrapolaciji.
% Metoda izracuna priblizek I_1 za integral po Simpsonovem pravilu na
% [a,b]. Nato primerja rezultat z I_2, ki da dobimo s Simpsonovim pravilom
% na dveh enako velikih podintervalih. 
% Ce je |I_1 - I_2| vecja od tol*(b-a), potem na vsakem od podintervalov
% rekurzivno poklicemo metodo in vrnemo priblizek za integral kot vsoto
% obeh prispevkov.
% Ce je razlika |I1 - I2| manjsa oz. enaka kot zahtevana natancnost
% tol*(b-a), le se izboljsamo rezultat tako, da naredimo en korak
% Richardsonove ekstrapolacije.
%
% Vhodni podatki
% funkcija f,
% interval [a, b]
% natancnost tol. 
%
% Izhodni podatki
% priblizek za integral
% najvecja dosezena globina rekurzije

c = (b+a)/2;

v1 = ((b-a)/6)*(f(a) + 4*f(c) + f(b));
v2 = ((c-a)/6)*(f(a) + 4*f((a+c)/2) + f(c));
v3 = ((b-c)/6)*(f(c) + 4*f((c+b)/2) + f(b));

if abs(v1 -(v2+v3)) < tol*(b-a)
    val = (16*(v2+v3)-v1)/15;
    maxlvl = 2;
else
    [val1, maxlvl1] = adaptiveSimpson(f,a,c,tol);
    [val2, maxlvl2] = adaptiveSimpson(f,c,b,tol);
    val = val1 + val2;
    maxlvl = max([maxlvl1 maxlvl2]) + 1;

end