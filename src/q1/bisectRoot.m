function [sol, i, err] = bisectRootvec(f, a, b, tol)
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
    %Usage:
    %   [r, i, err] = bisect(f,a,b,tol) -> returns the approximation to a root
    %   within [a, b], the number of iterations require to find the root
    %   and the final absolute error
    
    % check if all intervals are correctly defined
    assert(isequal(size(a), size(b)), "");
    
    % check whether f changes sign
    assert(all(sign(f(a)) ~= sign(f(b))),...
        'f(a) and f(b) should have opposite sign');
    
    % intialise variables
    % iteration counter
    i = 0;
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
        i = i + 1;
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
        sol(~withinTol) = (a + b)/2;
        err(~withinTol) = abs(sol - sol_old);
        withinTol(err < tol) = true;
    end   
end

