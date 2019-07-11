function G1 = GG(XX)
global ta;
A = [1 -0.5; 0 0.5];
b = [1; -1];
c = [0.5; 0.5];
d = -1;
de = 0.01;
e = 0.01;


xx1 = XX(1);
xx2 = XX(2);
zz1 = xx1 - 0.5*xx2 + 1;
zz2 = 0.5*xx2 - 1;
zz3 = 0.5*xx1 + 0.5*xx2 -1;

gg1 = ta*(2*zz1*zz3^(-1) - 0.5*zz3^(-2)*(zz1^2 + zz2^2)) + 0.5*(de - zz3)^(-1);
gg2 = ta*((-zz1 + zz2)*zz3^(-1)- 0.5 * (zz1^2 + zz2^2)*zz3^(-2)) + 0.5*(de - zz3)^(-1);
G1 = [gg1; gg2];
end