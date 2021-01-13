f = @(x) sin(x).^3;
% numerical second derivative 
d2 = @(f, x, h) (2*f(x) - 5*f(x + h) + 4*f(x + 2*h) - f(x + 3*h))./(h.^2);
% true second derivative
d2True = @(x) -3*sin(x)^3 + 3*cos(x)*sin(2*x);

% x value to find derivative at
x = 1;

h = logspace(-8,0,500);

% calculate vector of second derivatives 
df2 = d2(f, x, h);
% calculate absolute error
err = abs(df2 - d2True(x));

% plot absolute error
loglog(h,err,"LineWidth",2);
grid on
xlabel("h")
ylabel("Absolute Error")
title("Effect of h on absolute error")