f = @(x) 4*exp(-x.^2/5) - cos(5*x) - 2;
pltFunc(f,  [-2*pi 2*pi], inf);