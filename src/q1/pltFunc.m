function pltFunc(f, domain, discontLim)
    %pltFunc plots function f between values of xLim removing any values
    % that are greater than discontLim to prevent MATLAB plotting
    % discontinuous functions as continous and plots a line of x = 0 to
    % help make any zeros clear
    %
    % Input:
    %   f = function handle to plot
    %   domain = 1x2 vector containing the lower and upper bound of the 
    %   domain of f
    %   discountLim = absolute values of the function greater than this are
    %   changed to NaN. Setting to inf will plot all values of the function
    %
    % Usage:
    %   pltFunc(@(x) 1./x, [-10 10], 5) -> Plots 1/x between -10 and 10
    %   changing the values where |1/x|>5 to NaN
    
    
    % Check xLim is the correct dimensions
    assert(isequal(size(domain), [1 2]), "domain must be a 1x2 vector")
    
    %% Generate values to plot
    x = linspace(domain(1), domain(2));
    y = f(x);
    
    % Remove large values of y to prevent MATLAB plotting discontinuous
    % functions as continuous
    y(abs(y)>discontLim) = NaN;
    
    %% Plot function and line x = 0
    plot(x, y, [min(x) max(x)], [0 0], "g-", "LineWidth", 2);
    xlabel("x");
    ylabel("f(x)");
    xlim(domain);
    title("Plot of f(x)");
    grid on;
end

