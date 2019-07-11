x1 = -3:7/119:4;
x2 = x1;
[X,Y]=meshgrid(x1,x2);

Z = sin(X+Y)+(X-Y).^2-1.5*X+2.5*Y+1;
mesh(X,Y,Z);