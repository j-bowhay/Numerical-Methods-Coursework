function xn = fixedPointRoot(g, x0, tol, nMax)
    % fixedPointRoot Iteration to find solutions of x = g(x)
    %
    %Inputs:
    %   g = function handle to find the solutions of x = g(x)
    %   x0 = first term of the iteration
    %   tol = absolute error tolerance with which to find the root
    %   iteration terminates when the root is known to within +/- tol
    %   nMax = the maximum number of iteration to quit after. Prevents an
    %   infinite loop if the iterations do not converge
    %
    %Output:
    %   xn = the iteraterative sequence where the final term is the best
    %   is the closest approximation to the solution if the sequence has
    %   converged
    %
    %Usage:
    %   xn = fixedPointRoot(@(x) cos(x), 0.75, 5e-7, 100) -> looks for a
    %   root of the equation x - cos(x) = 0, starting with an inital guess
    %   of 0.75. The iteration will either finish when the solution is
    %   accurate to 6 decimal places or the sequence hasn't converged to
    %   this level of accuracy after 100 iterations
    
    
    % number of iterations
    n = 0;
    % preallocated sequence array and set initial guess as first term
    xn = NaN(1, nMax);
    xn(1) = x0;
    % set initial error
    err = Inf;
    
    % iterate x -> g(x)
    while err > tol && n < nMax
        n = n + 1;
        xn(n + 1) = g(xn(n));
        err = abs(xn(n + 1) - xn(n));
    end
    
    % remove any unused elements of the preallocated array
    xn(isnan(xn)) = [];
    
    % print final summary
    if err > tol
        error('No convergence after %d steps',n)
    else
        fprintf('\nConvergence after %d steps to a root at %-20.14g\n',...
            n, xn(end));
        fprintf('Final absolute error is %g\n\n', err);
    end 
end