f = @(x) 7*x.^6 - 3*x.^4 - 9*x.^2 -5;
a = 3;
b = 4;
tol = 5e-9;
% using Simpson's 3/8 rule
[q, h, err] = compositeQuad(f, @simpson38, a, b, tol);
loglog(h(2:end), err)

polyfit(h(2:end), err, 1)