function [t, y] = ode45Projectile(rhs, tSpan, y0, g, mu)
    [t, y] = ode45(@(t, y) rhs(t, y, g, mu), tSpan, y0');
end