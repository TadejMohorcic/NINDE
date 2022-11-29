f = @(x,y) (sin(x-1/4).^2).*cos(2*y-1/3);

% A del naloge
o1 = trapezoid2D(f,0,1,0,1,3,3);

% B del naloge
val = trapezoid2D(f,0,1,0,1,30,30);
r = integral2(f,0,1,0,1);

a = abs(r - val);
b = abs(r - o1);

o2 = log10(b/a);

% C del naloge
o3 = simpson2D(f,0,1,0,1,2,3);

% D del naloge
v1 = simpson2D(f,-1.5,-0.5,-0.5,0.5,3,3);
v2 = simpson2D(f,-0.5,0.5,-0.5,0.5,3,3);
v3 = simpson2D(f,0.5,1.5,-0.5,0.5,3,3);
v4 = simpson2D(f,-0.5,0.5,0.5,1.5,3,3);
v5 = simpson2D(f,-0.5,0.5,-1.5,-0.5,3,3);

g1 = @(r,h) sin(r.*cos(h)+1/4).^2.*cos(2.*r.*sin(h)+2/3).*r;
g2 = @(r,h) sin(r.*cos(h)-3/4).^2.*cos(2.*r.*sin(h)+2/3).*r;
g3 = @(r,h) sin(r.*cos(h)-3/4).^2.*cos(2.*r.*sin(h)-4/3).*r;
g4 = @(r,h) sin(r.*cos(h)+1/4).^2.*cos(2.*r.*sin(h)-4/3).*r;

v6 = simpson2D(g1,0,1,0,pi/2,3,3);
v7 = simpson2D(g2,0,1,pi/2,pi,3,3);
v8 = simpson2D(g3,0,1,pi,3*pi/2,3,3);
v9 = simpson2D(g4,0,1,3*pi/2,2*pi,3,3);

o4 = v1+v2+v3+v4+v5+v6+v7+v8+v9;