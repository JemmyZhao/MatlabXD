function A = cal_rot_pinv(x,y)
x1 = x';
y1 = y';
A = y1 * pinv(x1);