t = 0;
N = 5012.00;
b = 0.48;
g = 0.11;
C = (N - g*N/b*log(N-1));
S0 = N-1;
I0 = 1;
R0 = 0;

f1 = @(S,I,R) -1/N*b*I*S;
f2 = @(S,I,R) 1/N*b*I*S - g*I;
f3 = @(S,I,R) g*I;

f = @(t,S) -1/N*b*(-S + g*N/b*log(S) + C)*S;

% A del naloge
[x1,y1] = BDF(f,0,50,S0,0.1);
o1 = y1(end);


