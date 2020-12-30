function quad = simpson38(f, a, b)
    %simpson38 approximates integral of f(x) over interval [a,b] by using
    %Simpson's 3/8 rule
    %
    %Inputs:
    %   f = function handle of the integrand f(x)
    %   a = lower bound of the interval
    %   b = upper bound of the interval
    %
    %Outputs:
    %   quad = approximate quadrature
    %
    %Usage:
    %   quad = simpson38(@(x) x^2, 0, 0.5) -> returns the approximate
    %   intergal of x^2 in the interval [0, 0.5]
    
    quad = (b - a)/8 .* (f(a) + 3*f((2*a + b)/3) + 3*f((a + 2*b)/3)...
        + f(b));
end

