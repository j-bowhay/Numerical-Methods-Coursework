f = @(x) sin(x).^3;
d2 = @(f, x, h) (2*f(x) - 5*f(x + h) + 4*f(x + 2*h) - f(x + 3*h))./(h.^2);

x = 1;
h = logspace(-8,0,500);

df2 = d2(f, x, h);
err = abs(df2(2:end) - df2(1:end-1));
errTheoretical = (11/12)*h.^2*f(x) + (12*f(x)*eps)./(h.^2);
hstar = nthroot((144*eps)/11, 4);
estar = (11/12)*hstar.^2*f(x) + (12*f(x)*eps)./(hstar.^2);

loglog(h(2:end),err,h, errTheoretical,"LineWidth",2);

hold on
plot(hstar,estar,"kx","MarkerSize",20, "LineWidth",2);

legend("Absolute Error", "Theoretical Absolute Error",...
    "Theoretical Minimum Error")
grid on
xlabel("h")
ylabel("Absolute Error")
title("Effect of h on absolute error")