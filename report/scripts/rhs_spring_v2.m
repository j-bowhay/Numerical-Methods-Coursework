function dxdt = rhs_spring_v2(t,y,m)

c = 0.28;
k = 53.4;
g = 9.81;
F = m*g;

dxdt = [ y(2) ; (F-c*y(2)-k*y(1))/m ];

end