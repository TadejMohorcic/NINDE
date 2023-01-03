N = 5012.00;
b = 0.48;
g = 0.11;

C = (N - g*N/b*log(N-1));

h = @(t,x) [-1/N*b*x(2)*x(1); 1/N*b*x(2)*x(1) - g*x(2); g*x(2)];
f = @(t,x) -1/N*b*(-x + g*N/b*log(x) + C)*x;

% A del naloge
[x1,y1] = BDF(f,0,50,N-1,0.1);
o1 = y1(end);

% B del naloge
[x2,y2] = BDF(h,0,50,[N-1;1;0],0.5);
o2 = y2(2,end);

% C del naloge
[x3,y3] = BDF(h,0,25,[N-1;1;0],0.5);
b = b/2;
h = @(t,x) [-1/N*b*x(2)*x(1); 1/N*b*x(2)*x(1) - g*x(2); g*x(2)];
[x4,y4] = BDF(h,24,50,[y3(:,[end-2 end-1 end])],0.5);
o3 = y4(2,end);



