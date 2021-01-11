function [value, isTerminal, direction] = xaxisEvent(t, y)
    % halt when the ball reaches xaxis ie. y = 0
    value = y(2);
    % end integration
    isTerminal = 1;
    % ball should be falling
    direction = -1;
end

