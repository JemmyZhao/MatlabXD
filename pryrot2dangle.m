function dangle = pryrot2dangle(ROT, enc_x, enc_y, enc_z)
A = [sin(enc_y)     0       -cos(enc_y)*cos(enc_x);
        0           1       -sin(enc_x);
     -cos(enc_y)    0       -sin(enc_y)*cos(enc_x);];
A_ = inv(A);
if(cos(enc_x) ~= 0)
A_1 = [sin(enc_y)   0       -cos(enc_y);
       -sin(enc_x)*cos(enc_y)/cos(enc_x)    1   -sin(enc_y)*sin(enc_x)/cos(enc_x);
       -cos(enc_y)/cos(enc_x)               0   -sin(enc_y)/cos(enc_x);];
end
B = A_-A_1;
a = sign(ROT(1,2))*0.5*(abs(ROT(1,2))+abs(ROT(2,1)));
b = sign(ROT(1,3))*0.5*(abs(ROT(1,3))+abs(ROT(3,1)));
c = sign(ROT(2,3))*0.5*(abs(ROT(2,3))+abs(ROT(3,2)));
vec = [a;b;c];
dangle = A_*vec;