function cobwebDiagram(g, x0, tol, nMax)
    %UNTITLED14 Summary of this function goes here
    %   Detailed explanation goes here
    
    %% get fixed point iteration sequence
    xn = fixedPointRoot(g, x0, tol, nMax);
    
    %% generate cobweb diagram
    % find the interval in which the sequence xn lies in
    a = 0.9 * min(xn);
    b = 1.1 * max(xn);
    
    % get values for the line y = x and y = g(x)
    x = linspace(a, b);
    y = g(x);
    
    % set up figure
    hold on;
    grid on;
    set(gca, "DefaultLineLineWidth", 2);
    title("Cobweb plot for fixed point iteration");
    xlabel("x");
    ylabel("y")
    xlim([a b])
    ylim([min(x(1), y(1)) max(x(end), y(end))]);
    
    % plot lines y = x and y = g(x)
    plot(x, x, "r-", "DisplayName", "y = x");
    plot(x, y, "k-", "DisplayName", "y = g(x)");
    legend("AutoUpdate", "off");
    
    % plot the steps
    plot([xn(1) xn(1)], [0 xn(2)],'m-');
    for i=1:length(xn) - 2
        plot([xn(i) xn(i + 1)], [xn(i + 1) xn(i + 1)],'m--');
        plot([xn(i + 1) xn(i + 1)], [xn(i + 1) xn(i + 2)],'m-');
    end
end

