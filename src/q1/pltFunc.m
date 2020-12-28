function pltFunc(f, xLim, discontLim)
    %pltFunc plots function f between values of xLim removing any values
    % that are greater than discontLim to prevent MATLAB plotting
    % discontinuous functions as continous
    %
    % Input:
    %   f = function handle to plot
    %   xLim = domain of function to plot
    %   discountLim = absolute values of the function greater than this are
    %   changed to NaN. Setting to inf will plot all values of the function
    %
    % Usage:
    %   pltFunc(@(x) 1./x, [-10 10], 5) -> Plots 1/x between -10 and 10
    %   changing the values where |1/x|>5 to Nan
    
    
    % Check xLim is the correct dimensions
    assert(isequal(size(xLim), [1 2]), "xLim must be a 1x2 array")
    
    %% Generate values to plot
    x = linspace(xLim(1), xLim(2));
    y = f(x);
    
    % Remove large values of y to prevent MATLAB plotting discontinuous
    % functions as continuous
    y(abs(y)>discontLim) = NaN;
    
    %% Plot function
    plot(x, y);
    xlabel("x");
    ylabel("f(x)");
    title("Plot of f(x)");
    grid on;
end

