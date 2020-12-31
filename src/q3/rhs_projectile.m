function dydt = rhs_projectile(t, y, g, mu)
    dydt = [y(3), y(4), -mu * y(3) * (y(3)^2 + y(4)^2)^0.5,...
        -g - mu * y(4) * ((y(3)^2 + y(4)^2)^0.5)];
end

