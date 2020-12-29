f = @(x) x.^4 - exp(-x).*cos(x);
tic
bisectRoot(f, -1.5, -1, 5e-9)
toc
tic
[x,y,z]=bisectRootvec(f, -1.5, -1, 5e-9)
toc