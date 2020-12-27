function [t,y]=backwardEuler(tspan,N)

x0=1;
t0=tspan(1);  tend=tspan(2);
t=linspace(t0,tend,N+1)';
y=zeros(size(t));
h=(tend-t0)/N;

y(1)=x0;
for k=1:N
    y(k+1)=(y(k)+h*(t(k)+h))/(1+10*h);
end

end