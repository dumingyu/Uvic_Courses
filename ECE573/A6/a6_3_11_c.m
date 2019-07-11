% problem 3.11(c)
A = [1 0;0 -1;-1 1];
b = [3; 0; 1.7];
H = [5 4;4 5];
p = [-34; -38];

cvx_begin
variable X(2,1);
minimize(X'*H*X+X'*p+74)
subject to 
A*X <= b;
cvx_end
