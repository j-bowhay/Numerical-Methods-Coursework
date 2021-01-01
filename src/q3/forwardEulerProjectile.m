function [t, y] = forwardEulerProjectile(rhs, tSpan, y0, g, mu, n)
    %forwardEulerProjectile solves the projectiles motion using forward
    %euler
    %   
    %Inputs:
    %   rhs = function handle for rhs of ode returning a column vector
    %   [x,y,u,v]
    %   tSpan = vector [a,b] which is the time interval to solve ODE over
    %   y0 = 1*4 vector of initial conditions [x0,y0,u0,v0]
    %   g = value of the acceleration due to gravity
    %   mu = value of the drag parameter
    %   n = the number of steps to split integration over
    %
    %Outputs:
    %   t = column vector of solution times
    %   y = matrix of solutions where each row is the values of each of the
    %   varibles at the corisponding value of t in the same fashion as
    %   ode45
    %Usage:
    %   [t,y]=forwardEulerProjectile(@rhsProjectile, [0 5],...
    %   [0 0 31 21]', 9.81, 2.79e-2, 100) -> Solves the projectile ODE from
    %   t=1 to 5 with 100 steps
    
    
    t = linspace(tSpan(1), tSpan(end), n + 1);
    % preallocate solution matix
    y = zeros(numel(t), numel(y0));
    % calculate step size
    h = (tSpan(end) - tSpan(1))/n;
    
    % parse parameter values to RHS function
    f = @(t,y) rhs(t, y, g, mu);
    
    % set initial conditions
    y(1,:) = y0';
    
    % forward euler method
    for i = 1:n
       y(i + 1,:) = y(i,:) + h * f(t(i), y(i,:))';
    end
    
end

