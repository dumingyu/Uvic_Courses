load('boat512.mat');
n = 512;
mu = 0.2;
X = boat512/256;

randn('state',29);

W = 0.1*randn(512,512);

Y = X + W;

C = dctmtx(n);

theta = sign(C*Y*C').*max(abs(C*Y*C')-mu,0);

X_after = C'*theta*C;

SNR_before = 20*log10(norm(X, 'fro')/norm(Y - X, 'fro'));

SNR_after = 20*log10(norm(X, 'fro')/norm(X_after - X, 'fro'));

disp('SNR_before is');
disp(SNR_before);
disp('SNR_after is');
disp(SNR_after);

figure;
imshow(boat512,[]);

figure;
imshow(Y,[]);

figure;
imshow(X_after,[]);
