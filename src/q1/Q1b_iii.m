f = @(x) cot(x) - 25./(25*x - 1);
a = [-5 -1 4];
b = [-4 -0.1 5];
[r, i, err] = bisectRoot(f, a, b, [5e-8 5e-9 5e-8])