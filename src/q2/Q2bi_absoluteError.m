f = @(x) sin(x).^3;
% numerical second derivative 
d2 = @(f, x, h) (2*f(x) - 5*f(x + h) + 4*f(x + 2*h) - f(x + 3*h))./(h.^2);

% x value to find derivative at
x = 1;

h = logspace(-8,0,500);

% calculate vector of second derivatives 
df2 = d2(f, x, h);
% calculate absolute error
err = abs(df2(2:end) - df2(1:end-1));

% plot absolute error
loglog(h(2:end),err,"LineWidth",2);
grid on
xlabel("h")
ylabel("Absolute Error")
title("Effect of h on absolute error")
[m,i]=min(err);
% calculate order of rounding and truncation
polyfit(log(h(1:i)),log(err(1:i)),1)
polyfit(log(h(i:end-1)),log(err(i:end)),1)