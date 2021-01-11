%% setup parameters
tSpan = [0 5];
v0 = 38;
theta0 = deg2rad(35);
g = 9.81;
mu = 2.79e-2;
h = 0.5;
n = (tSpan(end) - tSpan(1))/h;

%initial conditions
y0 = [0 0 v0*cos(theta0) v0*sin(theta0)]';

%% solve ODE
%ode45
[t, yode45] = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan, y0);

%forward euler
[t, yFE] = forwardEulerProjectile(@rhsProjectile, tSpan, y0, g, mu, n);

%runge-kutta 4th order
[t, yRK4] = rk4Projectile(@rhsProjectile, tSpan, y0, g, mu, n);

%% plot figure
% configure plot
hold on
grid on
legend
set(gca, "DefaultLineLineWidth", 2);
xlabel("x")
ylabel("y")
title("Comparison of ODE solvers")

% plot data
plot(yode45(:,1), yode45(:,2), "g-", "DisplayName", "ode45",...
    "LineWidth", 3)
plot(yFE(:,1), yFE(:,2), "r-", "DisplayName", "Forward Euler")
plot(yRK4(:,1), yRK4(:,2), "m-", "DisplayName", "4th Order Runge-Kutta")
