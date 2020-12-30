function [quad, err] = compositeQuad(f, i, a, b, tol)
    %UNTITLED17 Summary of this function goes here
    %   Detailed explanation goes here
    
    nMax = 25;
    
    n = 1;
    N = 2;
    err = inf(1, nMax);
    quad = NaN(1, nMax);
    
    while all(err > tol) && n < nMax
        h = (b - a)/N;
        quad(n) = sum(i(f, a + h.*[0:N-1], a + h.*[1:N]));
        try
            err(n) = abs(quad(n) - quad(n - 1));
        catch
            err(n) = [];
        end
        n = n + 1;
        N = N*2;
    end
    err(isinf(err)) = [];
    quad(isnan(quad)) = [];
end

