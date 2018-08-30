function A = opt_cal_rot(x, y)
A = [1 0 0;
     0 1 0;
     0 0 1;];
xx = cal_cov(x,x);
xy = cal_cov(x,y);
for i=1:100
    temp = A - A*xx + xy;
    A = temp;
end
