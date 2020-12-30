function quad = compositeQuad(f, , a, b, tol)
    %UNTITLED17 Summary of this function goes here
    %   Detailed explanation goes here
    
    nMAX = 25;
    
    n = 1;
    N = 2;
    err = inf(1, nMax);
    qSimp38 = NaN(1, nMax)
    
    while err > tol && n < nMax
        h = (b - a)/N;
        qSimp38(n) = sum(simpson38(f, a + h.*[0:N-1], a + h.*[1:N]));
        
    end
end

