function [sol, i, err] = bisectRoot(f, a, b, tol)
    %bisectRoot Use the bisection method to find roots of the function f
    %   bracketed within the intervals [a, b].
    %
    %Inputs:
    %   f = function handle to function whose root is to be found
    %   a = 1*n array containing all the lower ends of the brackets
    %   where n is the number of roots
    %   b = 1*n array containing all the lower ends of the brackets
    %   where n is the number of roots
    %   tol = absolute error tolerance with which to find the root;
    %   Iteration terminates when the root is known to within +/- tol
    %
    %Outputs:
    %   sol = 1*n array of of roots
    %   i = 1*n array of the number of iterations required to find the nth
    %   root
    %   err = 
    %
    %Usage:
    %   [r, i, err] = bisect(@(x) x.^2 - 4, 1, 3, 5e-9) -> returns the  
    %   approximation to root of x^2 - 4 = 0 within [1, 3], the number of  
    %   iterations required to find the root and the final absolute error
    
    % check if all intervals are correctly defined
    assert(isequal(size(a), size(b)),...
        "Must be an equal number of upper and lower bounds");
    
    % check whether f changes sign
    assert(all(sign(f(a)) ~= sign(f(b))),...
        'f(a) and f(b) should have opposite sign');
    
    % intialise variables
    % iteration counter
    i = zeros(size(a));
    % current solution estimate
    sol = (a + b)/2;
    % previous solution estimate
    sol_old = Inf;
    % absolute error
    err = Inf;
    withinTol = zeros(size(a));
    
    % bisection algorithm:
    % at each iteration, find the half-interval that contains a sign change
    % and relabel the endpoints appropriately
    while any(~withinTol)
        i(~withinTol) = i(~withinTol) + 1;
        sol_old = sol;
        mid = (a + b)/2;
        
        % mid point is a root
        exactRoot = f(mid) == 0;
        sol(exactRoot) = mid(exactRoot);
        err(exactRoot) = 0;
        withinTol(exactRoot) = true;
        
        % solution is in first half of interval and mid point not a root
        firstHalf = (sign(f(a)) ~= sign(f(mid))) & ~exactRoot;
        b(firstHalf) = mid(firstHalf);
        
        % solution is in second half of interval and mid point not a root
        secondHalf = (sign(f(a)) == sign(f(mid))) & ~exactRoot;
        a(secondHalf) = mid(secondHalf);
        
        % update solutions and errors values that aren't within tolerance
        sol(~withinTol) = (a(~withinTol) + b(~withinTol))/2;
        err(~withinTol) = abs(sol(~withinTol) - sol_old(~withinTol));
        withinTol(err < tol) = true;
    end
end

