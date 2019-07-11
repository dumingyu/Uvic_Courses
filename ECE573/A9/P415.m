A1 = [-1 0; 0 -1; 0.5 1];
b1 = [0; 0; 1];

A2 = [2 -1; -2 -1; 0 1];
b2 = [1.6; -2.4; 3];

y0 = [1;1];
v0 = [0; 0];

e_p = 0.000001;
e_d = e_p;
alpha = 0.01;
iteration_count= 1;

while 1
    cvx_begin quiet
    variable X(2,1);
    minimize(X'*X -2*(y0 - v0)'*X)
    subject to
    A1*X <= b1;
    cvx_end

    cvx_begin quiet
    variable Y(2,1);
    minimize(Y'*Y - 2*(X + v0)'*Y)
    subject to
    A2*Y <= b2;
    cvx_end
    iteration_count = iteration_count+ 1;
    if (norm(X - Y, 2) <= e_p) && (norm(-alpha*(Y - y0), 2) <= e_d)
        break
    end
    y0 = Y;
    v0 = v0 + (X - Y);
    
end
disp('X is');
disp(X);
disp('The iteration count is');
disp(iteration_count);

if((A1*X)<b1)
    if((A2*Y)<b2)
        disp('Since A1*X < b1 and A2*Y < b2,the conditions satisfied');
    else
        disp('A2*Y>b2');
    end
else
    disp('A1*X>b1');
end