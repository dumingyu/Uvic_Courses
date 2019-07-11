
[X,Y]=meshgrid(-3:7/119:4);

syms x1 x2

f = sin(x1+x2)+(x1-x2)^2-1.5*x1+2.5*x2+1;

h = hessian(f,[x1,x2]);
Z = ones(120);
for i = 1:length(X(1,:))
    for j = 1:length(Y(1,:))
        %x1 = X(1:i);
        %x2 = Y(1:j);
        h1 = subs(h(1,1),[x1,x2],[X(1,i),Y(1,j)]);
        h2 = subs(h(1,2),[x1,x2],[X(1,i),Y(1,j)]);
        h3 = subs(h(2,1),[x1,x2],[X(1,i),Y(1,j)]);
        h4 = subs(h(2,2),[x1,x2],[X(1,i),Y(1,j)]);
        hresult = [h1 h2;h3 h4];
        if eig(hresult)>= 0
            flg = 1;
        else
            flg = 0;
        Z(i,j) = flg;
        
        end
    end
end
%Z = sin(X+Y)+(X-Y)^2-1.5*X+2.5*Y+1;
mesh(X,Y,Z);