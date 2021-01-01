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
options = odeset("Events", @xaxisEvent);
[t, y, te, ye , ie] = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan,...
    y0, options);

%% display result
fprintf("Projectile first crosses x axis at %.13f\n", te)