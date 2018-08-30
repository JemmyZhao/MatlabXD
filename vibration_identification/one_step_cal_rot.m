function A = one_step_cal_rot(x, y)

B = cal_cov(x,x);
C = cal_cov(x,y);
A = B/C;


