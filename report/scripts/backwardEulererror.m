t_range = [0 1];
N = floor(logspace(1,5,250));
abserr = zeros(size(N));
y_exact = @(t) (10*t - 1 + 101*exp(-10*t))/100;
for i=1:length(N)
    [t,y]=backwardEuler(t_range,N(i));
    abserr(i)=abs(y_exact(t_range(2))-y(end));
end
loglog((t_range(2)-t_range(1))./N,abserr,'r-','LineWidth',2)
xlabel('h'); ylabel('absolute error');
grid on;