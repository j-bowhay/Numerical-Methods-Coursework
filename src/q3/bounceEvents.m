function [value, isTerminal, direction] = xaxisEvent(t, y)
    % Halt when the ball reaches xaxis ie. y = 0
    value = y(2);
    % End integration
    isTerminal = 1;
    direction
end

