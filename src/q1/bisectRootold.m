function [sol,err] = bisectRoot(f, a, b, tol)
    %bisectRoot Use the bisection method to find a root of the function f
    %   bracketed within the interval [a, b].
    %
    %Inputs:
    %   f = function handle to function whose root is to be found
    %   a = one end of the bracket
    %   b = other end of the bracket
    %   tol = absolute error tolerance with which to find the root;
    %Iteration terminates when the root is known to within +/- tol
    %
    %Usage:
    %   [r,err] = bisect(f,a,b,tol) -> returns the approximation to a root
    %   within [a, b], and the final absolute error
    
    % check whether f changes sign
    assert(sign(f(a)) ~= sign(f(b)),...
        'f(a) and f(b) should have opposite sign');
    
    % intialise variables
    % iteration counter
    n = 0;
    % current solution estimate
    sol = (a + b)/2;
    % previous solution estimate
    sol_old = Inf;
    % absolute error
    err = Inf;
    
    % set up the output format
    displayfmt = ' %3d  %20.14f  %20.14f\n';
    fprintf('   n                   x_n         |x_n-x_{n-1}|\n');
    fprintf(displayfmt, n, sol, err);
    
    % bisection algorithm:
    % at each iteration, find the half-interval that contains a sign change
    % and relabel the endpoints appropriately
    while err > tol
        n = n + 1;
        sol_old = sol;
        mid = (a + b)/2;
        
        % Check if midpoint is the root
        if f(mid) == 0
            sol = mid;
            err = 0;
            fprintf(displayfmt, n, sol, err);
            break;
        % Check if root is in first half of the interval
        elseif sign(f(a))~= sign(f(mid))
            b = mid;
        else
            a = mid;
        end
        
        % Generate current solution and error
        sol = (a + b)/2;
        err = abs(sol - sol_old);
        fprintf(displayfmt, n, sol, err);
    end
    
    % print final summary
    fprintf('\nConvergence after %d steps to a root at %-20.14g\n',...
        n, sol);
    fprintf('Final absolute error is %g\n\n', err);
    
end
