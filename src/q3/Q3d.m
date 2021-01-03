%% setup parameters
tSpan = [0 5];
v0 = 38;
theta0 = deg2rad(35);
g = 9.81;
mu = 2.79e-2;
n = floor(logspace(1,5,250));
h = nan(size(n));
err = nan(size(n));

%initial conditions
y0 = [0 0 v0*cos(theta0) v0*sin(theta0)]';

%% solve ODE
%ode45
sol = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan, y0);

for i = 1:length(n)
    %forward euler
    [t, yFE] = forwardEulerProjectile(@rhsProjectile, tSpan, y0, g, mu, n(i));
    yExact = deval(sol, t)';
    
    h(i) = (t(end) - t(1))/n(i);
    err(i) = sum(vecnorm(yFE - yExact, 2, 2))/t(end);
end

loglog(h, err)
grid on
polyfit(log(h), log(err),1)