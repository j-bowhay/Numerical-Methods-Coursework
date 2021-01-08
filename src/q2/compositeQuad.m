function [compQuad, h, err] = compositeQuad(f, i, a, b, tol)
    %compositeQuad amproximate quadrature using a Newton-Coutes method
    %
    %Inputs:
    %   f = function handle of the integrand
    %   i = function handle of the Newton-Coutes method to use. Must be in
    %   the format i(f, a, b) where f is the integrand and [a,b] is the
    %   interval to integrate over
    %   a = lower bound of the interval
    %   b = upper bound of the interval
    %   tol = desired absolute error tolerance
    %
    %Outputs:
    %   compQuad = vector of the sucessive approximates of the
    %   quadrature where the final entry is the final approximate
    %   h = vector of the step size used at each approximation
    %   err = vector of the absolute error at each approximation
    %
    %Usage:
    %   compositeQuad(@(x) exp(x), @(f, a, b) (b - a)/2 .*(f(a) + f(b)),...
    %   0, 1, 5e-4) -> Estimates the quadrature of e^x in the interval
    %   [0,1] using the trapezium rule to 3 decimal places
    
    
    % max number of iterations to prevent infinite loop
    nMax = 25;
    % iteration counter
    n = 1;
    % number of subintervals
    N = 2;
    % preallocate vectors for the error, quadrature and step size
    err = inf(1, nMax);
    compQuad = NaN(1, nMax);
    h = NaN(1, nMax);
    
    % composite algorithm
    while all(err > tol) && n < nMax
        % generate step size
        h(n) = (b - a)/N;
        % calculate lower bounds
        lowerBounds = a + h(n).*[0:N-1];
        % calculate upper bounds
        upperBounds = a + h(n).*[1:N];
        % calculate quadrature using given Newton-coutes method
        compQuad(n) = sum(i(f, lowerBounds, upperBounds));
        % calculate absolute error
        try
            err(n) = abs(compQuad(n) - compQuad(n - 1));
        catch
            % prevents error when calculating first error term as no
            % previous approximation to compare againsy
            err(n) = inf;
        end
        n = n + 1;
        N = N * 2;
    end
    % removed any used preallocation
    err(isinf(err)) = [];
    compQuad(isnan(compQuad)) = [];
    h(isnan(h)) = [];
end

