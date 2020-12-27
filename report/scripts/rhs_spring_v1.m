function dxdt = rhs_spring_v1(t,y)

m = 0.075;
c = 0.28;
k = 53.4;
g = 9.81;
F = m*g;

dxdt = [ y(2) ; (F-c*y(2)-k*y(1))/m ];

end