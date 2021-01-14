% intergrand
f = @(x) exp(x) - x;
% interval
a = 0;
b = 5;
tol = 5e-7;
% using Simpson's 3/8 rule
compositeQuad(f, 1, a, b, tol)
% using Milne's rule
compositeQuad(f, 2, a, b, tol)