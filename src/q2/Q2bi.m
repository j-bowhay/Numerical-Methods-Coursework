f = @(x) sin(x).^3;
d2 = @(f, x, h) (2*f(x) - 5*f(x + h) + 4*f(x + 2*h) - f(x + 3*h))./(h.^2);

x = 1;
h = logspace(-16,0,500);

df2 = d2(f, x, h);
err = abs(df2(2:end) - df2(1:end-1));
loglog(h(2:end),err);