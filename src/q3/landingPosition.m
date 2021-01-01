function x = landingPosition(theta)
    %% setup parameters
    tSpan = [0 5];
    v0 = 38;
    g = 9.81;
    mu = 2.79e-2;
    theta0 = deg2rad(theta);
    
    %% solve ODE for a range of theta
    %set event detection
    options = odeset("Events", @xaxisEvent);
    % calculate initial conditions for a given theta
    y0 = [-40 0 v0*cos(theta0) v0*sin(theta0)]';
    % solve ODE
    [t, y, te, ye , ie] = ode45(@(t, y) rhsProjectile(t, y, g, mu), tSpan,...
    y0, options);

    x = ye(1);
end

