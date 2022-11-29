function val = trapezoid2D(f,a,b,c,d,n,m)
h1 = (b-a)/n;
h2 = (d-c)/m;

v = ones(1,n+1);
u = ones(1,m+1);

for i = 2:n
    v(i) = 2;
end

for i = 2:m
    u(i) = 2;
end

M = v'.*u;

val = 0;

for i = 1:n+1
    for j = 1:m+1
        val = val + M(i,j)*f(a+(i-1)*h1, c+(j-1)*h2);
    end
end

val = ((h1*h2)/4)*val;

end