%% setup parameters
tSpan = [0 5];
v0 = 38;
g = 9.81;
mu = 2.79e-2;
h = 0.5;
n = (tSpan(end) - tSpan(1))/h;

%% solve ODE for a range of theta
%set event detection
options = odeset("Events", @xaxisEvent);

% generate range of theta
theta = [0:90];
landingPosition = zeros(1,91);

for i=theta
    theta0 = deg2rad(i);
    % calculate initial conditions for a given theta
    y0 = [-40 0 v0*cos(theta0) v0*sin(theta0)]';
    % solve ODE
    [t, y, te, ye , ie] = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan,...
    y0, options);
    % extract landing position
    landingPosition(i+1) = ye(1);
end

%% Plot results
% configure plot
hold on
grid on
set(gca, "DefaultLineLineWidth", 2);
xlabel("\theta_{0}")
ylabel("x")
title("Landing position against theta")

plot(theta,landingPosition)
plot([0 90], [0 0],'g-')

