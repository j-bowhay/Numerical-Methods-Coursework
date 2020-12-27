function [t,y]=trapezoid(tspan,N)

x0=1;
t0=tspan(1);  tend=tspan(2);
t=linspace(t0,tend,N+1)';
y=zeros(size(t));
h=(tend-t0)/N;
Hm=1-5*h;
Hp=1+5*h;

y(1)=x0;
for k=1:N
    y(k+1)=(Hm/Hp)*y(k)+h*(t(k)+h/2)/Hp;
end

end