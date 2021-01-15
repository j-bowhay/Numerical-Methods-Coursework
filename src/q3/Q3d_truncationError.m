%% setup parameters
tSpan = [0 5];
v0 = 38;
theta0 = deg2rad(35);
g = 9.81;
mu = 2.79e-2;
% number of steps
n = floor(logspace(1,6));
% preallocate step size and error
h = nan(size(n));
err = nan(size(n));

% initial conditions
y0 = [0 0 v0*cos(theta0) v0*sin(theta0)]';

%% solve ODE
%use ode45 to get "exact" solution
options = odeset("RelTol",1e-6,"AbsTol",1e-9);
sol = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan, y0, options);

for i = 1:length(n)
    % find the solution using FE for the given number of steps
    [t, yFE] = forwardEulerProjectile(@rhsProjectile, tSpan, y0,...
        g, mu, n(i));
    % interpolate ode45 at the correct times
    yExact = deval(sol, t)';
    
    % calculate step size
    h(i) = (t(end) - t(1))/n(i);
    % find the local error at each step
    localErr = vecnorm(yFE - yExact, 2, 2);
    %integrate to find global error
    err(i) = trapz(t,localErr)/t(end);
end

%% Plot error convergance
loglog(h, err,"b-","LineWidth",2)
ylabel("Absolute Error")
xlabel("h")
title("Affect of h on absolute error")
grid on
polyfit(log(h), log(err),1)