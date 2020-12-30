function xn = fixedPointRoot(g, x0, nMax)
    % fixedPointRoot Iteration to find solutions of x = g(x)
    %
    %Inputs:
    %   g = function handle to find the solutions of x = g(x)
    %   x0 = first term of the iteration
    %   nMax = the maximum number of iteration to quit after
    %
    %Output:
    %   xn = the iteraterative sequence
    %
    %Usage:
    %   xn = fixedPointRoot(@(x) cos(x), 0.75, 100) -> looks for a
    %   root of the equation x - cos(x) = 0, starting with an inital guess
    %   of 0.75.
    
    
    % number of iterations
    n = 0;
    % preallocated sequence array and set initial guess as first term
    xn = NaN(1, nMax);
    xn(1) = x0;
    % set initial error
    err = Inf;
    
    % iterate x -> g(x)
    while n < nMax
        n = n + 1;
        xn(n + 1) = g(xn(n));
        err = abs(xn(n + 1) - xn(n));
    end
    
    % remove any unused elements of the preallocated array
    xn(isnan(xn)) = [];
    
    fprintf('\nAfter %d steps root is %-20.14g\n', n, xn(end));
    fprintf('Final absolute error is %g\n\n', err);
end