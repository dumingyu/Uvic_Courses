function  F = FF(XX)
global ta;
A = [1 -0.5; 0 0.5];
b = [1; -1];
c = [0.5; 0.5];
d = -1;
de = 0.01;
u = de - c'*XX -d;
f = (norm(A*XX + b,2))^2*(c'*XX+d)^(-1);
F = ta*f - log(-u);
end