f = @(x) sin(x).^3;
% numerical second derivative 
d2 = @(f, x, h) (2*f(x) - 5*f(x + h) + 4*f(x + 2*h) - f(x + 3*h))./(h.^2);
% true second derivative
d2True = @(x) -3*sin(x)^3 + 3*cos(x)*sin(2*x);
% true fourth derivative
d4True = @(x) -24*cos(x)*sin(2*x) + 9*sin(x)^3 - 12*sin(x)*cos(2*x);

% x value to find derivative at
x = 1;

h = logspace(-8,0,500);

df2 = d2(f, x, h);
err = abs(df2 - d2True(x));
errTheoretical = @(h) (11/12)*h.^2*f(x)*2.26 + (12*f(x)*eps)./(h.^2);
hstar = nthroot((144*eps*f(x))/(11*abs(d4True(x))), 4);
estar = errTheoretical(hstar);

loglog(h,err,h, errTheoretical(h),"LineWidth",2);

hold on
plot(hstar,estar,"kx","MarkerSize",20, "LineWidth",2);

legend("Absolute Error", "Theoretical Absolute Error",...
    "Theoretical Minimum Error")
grid on
xlabel("h")
ylabel("Absolute Error")
title("Effect of h on absolute error")