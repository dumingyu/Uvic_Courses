A = [1 -0.5; 0 0.5];
b = [1; -1];
c = [0.5; 0.5];
d = -1;
de = 0.01;
e = 0.0001;
global tau;
tau = 10;

syms x1 x2 tau;
f = ((x1-0.5*x2+1)^2+(0.5*x2-1)^2)/(0.5*x1+0.5*x2-1)-(1/tau)*(log(0.01-0.5*x1-0.5*x2+1));
g1 = diff(f,x1);
g2 = diff(f,x2);

h11 = diff(g1,x1);
h12 = diff(g1,x2);
h21 = diff(g2,x1);
h22 = diff(g2,x2);

x1 = 2;
x2 = 2;
X = [x1; x2];

L = 10/tau;
alpha = 0.1;

while L >= e 

G = [g1; g2];
H = [h11 h12; h21 h22];

dk = -inv(H)*G;
L = (0.5*G'*inv(H)*G)/10;

u = de - c'*X -d;
f = (norm(A*X + b,2))^2*(c'*X+d)^(-1);
F = ta*f - log(-u);

alpha = bt_lsearch(X,dk,'FF','GG');
X = X + alpha*dk;
tau = 10*tau;
end
disp(FF(X)/tau);
++
