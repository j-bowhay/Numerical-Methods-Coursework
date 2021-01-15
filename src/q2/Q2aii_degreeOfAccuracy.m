% polynomial order 1
compositeQuad(@(x) x ,1,0,1,5e-5)
compositeQuad(@(x) x ,2,0,1,5e-5)
% polynomial order 2
compositeQuad(@(x) x.^2 ,1,0,1,5e-5)
compositeQuad(@(x) x.^2 ,2,0,1,5e-5)
% polynomial order 3
compositeQuad(@(x) x.^3 ,1,0,1,5e-5)
compositeQuad(@(x) x.^3 ,2,0,1,5e-5)
% polynomial order 4
compositeQuad(@(x) x.^4 ,1,0,1,5e-5)
compositeQuad(@(x) x.^4 ,2,0,1,5e-5)