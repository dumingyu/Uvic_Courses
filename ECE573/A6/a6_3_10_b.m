% Problem 3.10(b)
A = [1 0;-1 1;1 1];
b = [3; -2; 2];
H = [4 1;1 1];
p = [2; 3];

cvx_begin
variable X(2,1);
minimize(X'*H*X+X'*p)
subject to
A*X <= b;
cvx_end