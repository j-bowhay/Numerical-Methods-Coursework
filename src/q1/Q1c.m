f = @(x) exp(-x) - x;
[r, n, e] = steffensenRoot(f, 0, 5e-13, 50);
%% Generate plot of convergence
loglog(e(1:end-1),e(2:end), "bx-", "LineWidth", 2)
title("Convergence of Steffensen's Method")
xlabel('\Delta_{n-1}');
ylabel('\Delta_{n}');
xlim([e(end - 1) e(1)]);
grid on;
%% Find order of congerence
polyfit(log(e(1:end-1)), log(e(2:end)), 1)