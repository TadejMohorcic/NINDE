f = @(x) sin(1./(x + 0.01));

% A del naloge
[val, ~] = adaptiveSimpson(f,0,1,inf);
r = integral(f,0,1);

o1 = abs(val-r);

% B in C del naloge
[val, maxlvl] = adaptiveSimpson(f,0,1,1e-3);

o2 = val;
o3 = maxlvl;
