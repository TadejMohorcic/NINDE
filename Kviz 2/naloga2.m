fun = @(t,y) sin(1.5^t) + sin(y);

a = 0;
b = 10;
y0 = 1;

% A del naloge
[t1,y1,ytol1,h1] = CashKarp(fun,a,b,y0,0.5,10e-3);
o1 = abs(y1(2) - ytol1(2));

% B del naloge
[t2,y2] = RungeKutta(fun,a,b,y0,0.1);
[t3,y3] = RungeKutta(fun,a,b,y0,0.05);
[t4,y4] = RungeKutta(fun,a,b,y0,0.02);

c = abs(y4(end) - y3(end));
d = abs(y4(end) - y2(end));
o2 = log2(d/c);

% C del naloge (NE DELA)
[t5,y5,ytol5,h5] = CashKarp(fun,a,b,y0,0.1,1e-8);
h5(end) = [];
o3 = max(h5)/min(h5);