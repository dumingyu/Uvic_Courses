cvx_begin
variable X(2,1);
minimize ((X(1)-2)^2 + (X(2)-1)^2)
subject to
(X(1)-4)^2/9 + (X(2)-5)^2/4 - 1 <= 0;
cvx_end
disp(X)