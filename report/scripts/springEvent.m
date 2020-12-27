function [value,terminal,direction] = springEvent(t,y)

value=y(2);     % look for y(2)=0
direction=-1;   % with y(2) decreasing
terminal=1;     % and stop the integration

end

