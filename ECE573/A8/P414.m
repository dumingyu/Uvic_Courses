%Signals x1 and x2 are generated
t = 0:1/511:1;
x1 = -1.8*sin(2*pi*1.2*t)+1.2*cos(2*pi*1.8*t)-sin(2*pi*3.1*t)-0.8; 
x1 = x1(:);
x2 = zeros(512,1); 
rand('state',14);
r = randperm(512); 
randn('state',28); 
x2(r(1:13)) = 2*randn(13,1);

%Matrix T1 is an DCT matrix and matrix T2 is an identity matrix
T1 = dctmtx(512);
T2 = eye(512);

%Noise w is generated
randn('state',10);
w = 0.01*randn(512,1);

mu = 0.01;
u = x1+x2+w;

x1_test = zeros(512,1); 
x2_test = zeros(512,1);

for i = 1:31
    b1 = T1*(u-x2_test);
    theta1 = sign(b1).*max(abs(b1)-mu,0);
    x1_new = T1'*theta1;
    b2 = T2*(u-x1_test);
    theta2 = sign(b2).*max(abs(b2)-mu,0);
    x2_new = T2'*theta2;
    x1_test = x1_new;
    x2_test = x2_new;
end

%Generate a plot that displays the data curve u versus t
figure('name','Generate a plot that displays the data curve u versus t');
plot(t,u);
%Generate a plot to show both x1 and its estimate x1_tilda;
figure('name','Generate a plot to show both x1 and its estimate x1_tilda');
plot(t,x1,'--',t,x1_test,':');
%Generate a plot to show both x2 and its estimate x2_tilda;
figure('name','Generate a plot to show both x2 and its estimate x2_tilda');
plot(t,x2,'--',t,x2_test,':');
%Compute average 2-norm estimation errors with n = 512;
n =512;
result1 = norm(x1_test - x1, 2)/sqrt(n);
result2 = norm(x2_test - x2, 2)/sqrt(n);
disp(result1);
disp(result2);

