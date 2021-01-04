%% setup parameters
tSpan = [0 5];
v0 = 38;
theta0 = deg2rad(35);
g = 9.81;
mu = 2.79e-2;
n=50000;

%initial conditions
y0 = [0 0 v0*cos(theta0) v0*sin(theta0)]';

%% solve ODE
%forward euler
[t, yFEtest] = forwardEulerProjectile(@rhsProjectile, tSpan, y0, g, mu, n)

%ode45
sol = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan, y0);
yode45 = deval(sol,t)';




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
plot(yFEtest(:,1), yFEtest(:,2), "r-", "DisplayName", "Forward Euler")
