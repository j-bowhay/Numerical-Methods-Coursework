% integrand
f = @(x) exp(x) - x;
% interval
a = 3;
b = 4;
tol = 5e-9;
% integrate using Simpson's 3/8 rule
[q, hSimp38, errSimp38] = compositeQuad(f, 1, a, b, tol);
% integrate using Milne's rule
[q, hMilne, errMilne] = compositeQuad(f, 2, a, b, tol);

% plot error
loglog(hSimp38(2:end), errSimp38,"x-",...
    hMilne(2:end), errMilne,"x-", "LineWidth",2);
legend("Simpson's 3/8 rule", "Milne's rule")
xlim([hSimp38(end) hSimp38(2)]);
xlabel("h")
ylabel("Absolute Error")
title("Effect of h on absolute error")
grid on;

% find gradient
polyfit(log(hSimp38(2:end)), log(errSimp38), 1)
polyfit(log(hMilne(2:end)), log(errMilne), 1)