A = [1 -0.5; 0 0.5];
b = [1; -1];
c = [0.5; 0.5];
d = -1;
de = 0.01;
e = 0.00000001;
global ta;
ta = 1;
gamma = 10;

%disp(X);
x1 = 3.5;
x2 = -1;
X = [x1; x2];

g1 = (2*x1 - x2 + 2)/(x1/2 + x2/2 - 1) - ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^2) - 1/(2*ta*(x1/2 + x2/2 - 101/100));
g2 = - (x1 - x2 + 2)/(x1/2 + x2/2 - 1) - 1/(2*ta*(x1/2 + x2/2 - 101/100)) - ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^2);

h11 = 2/(x1/2 + x2/2 - 1) + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3) - (2*x1 - x2 + 2)/(x1/2 + x2/2 - 1)^2;
h12 = (x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2) - 1/(x1/2 + x2/2 - 1) + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3) - (2*x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2); 
h21 = (x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2) - 1/(x1/2 + x2/2 - 1) + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3) - (2*x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2);
h22 = 1/(x1/2 + x2/2 - 1) + (x1 - x2 + 2)/(x1/2 + x2/2 - 1)^2 + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3);

G = [g1; g2];
H = [h11 h12; h21 h22];

dk = -inv(H)*G;
alpha =0.5;

while 1/ta >= e 

    while norm(alpha*dk) >= e
        %while L >= e
        %L = (0.5*G'*inv(H)*G);
        %u = de - c'*X -d;
        %f = (norm(A*X + b,2))^2*(c'*X+d)^(-1);
        %F = ta*f - log(-u);
        %alpha = bt_lsearch(X,dk,'FF','GG');

        X = X + alpha*dk;
        x1 = X(1);
        x2 = X(2);

        g1 = (2*x1 - x2 + 2)/(x1/2 + x2/2 - 1) - ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^2) - 1/(2*ta*(x1/2 + x2/2 - 101/100));
        g2 = - (x1 - x2 + 2)/(x1/2 + x2/2 - 1) - 1/(2*ta*(x1/2 + x2/2 - 101/100)) - ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^2);

        h11 = 2/(x1/2 + x2/2 - 1) + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3) - (2*x1 - x2 + 2)/(x1/2 + x2/2 - 1)^2;

        h12 = (x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2) - 1/(x1/2 + x2/2 - 1) + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3) - (2*x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2);

        h21 = (x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2) - 1/(x1/2 + x2/2 - 1) + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3) - (2*x1 - x2 + 2)/(2*(x1/2 + x2/2 - 1)^2);

        h22 = 1/(x1/2 + x2/2 - 1) + (x1 - x2 + 2)/(x1/2 + x2/2 - 1)^2 + 1/(4*ta*(x1/2 + x2/2 - 101/100)^2) + ((x1 - x2/2 + 1)^2 + (x2/2 - 1)^2)/(2*(x1/2 + x2/2 - 1)^3);

        G = [g1; g2];
        H = [h11 h12; h21 h22];
        dk = -inv(H)*G;

    end


ta = gamma*ta;
end

%disp(FF(X));
disp(X);