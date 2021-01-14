function [compQuad, h, err] = compositeQuad(f, mode, a, b, tol)
    %compositeQuad amproximate quadrature using a Newton-Coutes method
    %
    %Inputs:
    %   f = function handle of the integrand
    %   mode = the newton-coutes method to use: 1 - Simpson's 3/8, 2 -
    %   Milne's rule
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
    %   compositeQuad(@(x) exp(x), 1, 1, 5e-4) -> Estimates the quadrature
    %   of e^x in the interval [0,1] using the Simpson's 3/8 rule
    %   to 3 decimal places
    
    if mode == 1
        % Simpson's 3/8 rule
        % number of subintervals must be a multiple of 3
        N = 3;
        q = @(x, h) (3*h)/8*(f(x(1)) + 3*sum(f(x(2:3:end-2))...
            + f(x(3:3:end-1))) + 2*sum(f(x(4:3:end-3))) + f(x(end)));
    elseif mode == 2
        % Milne's rule
        % number of subintervals must be a multiple of 4
        N = 4;
        q = @(x, h) (4*h)/3*(2*sum(f(x(2:2:end-1))) - sum(f(x(3:4:end-2))));
    else
       error("Invalid mode") 
    end
    
    % max number of iterations to prevent infinite loop
    nMax = 50;
    % iteration counter
    n = 1;
    % preallocate vectors for the error, quadrature and step size
    err = inf(1, nMax);
    compQuad = NaN(1, nMax);
    h = NaN(1, nMax);
    
    % composite algorithm
    while all(err > tol) && n < nMax
        % generate step size
        h(n) = (b - a)/N;
        
        % generate equally spaced node
        x = linspace(a, b, N + 1);
        % calculate quadrature
        compQuad(n) = q(x, h(n));
        
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

