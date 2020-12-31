f = @(x) exp(x) - x;
a = 0;
b = 5;
tol = 5e-7;
% using Simpson's 3/8 rule
compositeQuad(f, @simpson38, a, b, tol)
% using Milne's rule
compositeQuad(f, @milne, a, b, tol)