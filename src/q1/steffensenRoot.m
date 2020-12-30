function [r, n, err] = steffensenRoot(f, x0, tol, nMax)
    %steffensenRoot uses Steffensen's method to find roots of f(x)
    %   based on an initial guess x0
    %
    %Inputs:
    %   f = function handle to function whose root is to be found
    %   x0 = initial guess of the root to begin iteration at
    %   tol = absolute error tolerance with which to find the root
    %   iteration terminates when the root is known to within +/- tol
    %   nMax = the maximum number of iteration to quit after. Prevents an
    %   infinite loop if the iterations do not converge
    %
    %Outputs:
    %   r = the approximate root of f(x)=0
    %   n = the number of interations
    %   err = 1*n vector of the absolute error after each interation
    %
    %Usage:
    %   [r, n, err] = steffensenRoot(@(x) exp(-x) -x, 0, 5e-9, 50) ->
    %   returns the approximate roo of x^-x -x = 0 after n iterations and
    %   err the absolute error after each iteration
    
    % set initial guess as first root
    xn = x0;
    %iteration counter
    n = 0;
    % preallocate error array
    err = Inf(1, nMax);
    
    while all(err > tol) && n < nMax
        n = n + 1;
        xOld = xn;
        % Calculate f(xn) to avoid repeat computation
        fn = f(xn);
        % Calculate next interation
        xn = xn - fn*(f(xn + fn)/fn - 1)^-1;
        err(n) = abs(xn - xOld);
    end
    
    % remove any unused preallocated element in error array
    err(isinf(err)) = [];
    
    % check if solution converged
    assert(err(end) < tol, "No convergence")
    
    r = xn;
end

