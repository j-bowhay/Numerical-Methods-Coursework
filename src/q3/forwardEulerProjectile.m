function [t, y] = forwardEulerProjectile(rhs, tSpan, y0, g, mu, n)
    %UNTITLED26 Summary of this function goes here
    %   Detailed explanation goes here
    
    t = linspace(tSpan(1), tSpan(end), n + 1);
    y = zeros(numel(t), numel(y0));
    h = (tSpan(end) - tSpan(1))/n;
    
    f = @(t,y) rhs(t, y, g, mu);
    
    % set initial conditions
    y(1,:) = y0';
    
    for i = 1:n
       y(i + 1,:) = y(i,:) + h * f(t(i), y(i,:))';
    end
    
end

