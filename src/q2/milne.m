function milneQuad = milne(f, a, b)
    %milne approximates integral of f(x) over interval [a,b] by using
    %Milne's rule
    %
    %Inputs:
    %   f = function handle of the integrand f(x)
    %   a = lower bound of the interval
    %   b = upper bound of the interval
    %
    %Outputs:
    %   milneQuad = approximate quadrature
    %
    %Usage:
    %   quad = milne(@(x) x^2, 0, 0.5) -> returns the approximate
    %   intergal of x^2 in the interval [0, 0.5]
    
    milneQuad = (b - a)/3 .* (2*f((3*a + b)/4) - f((a + b)/2)...
        + 2*f((a + 3*b)/4));
end
