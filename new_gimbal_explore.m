b = 20;
l = 200;
d = 150;
ks = 0.433;
g = 9.81;
m = 0.045;
M = 0.179;                                                                                                                                                                                                                                                    
mg = (m+M)*g;

theta_lim = 20*pi/180;
d_theta = 0.1*pi/180;
theta = [-theta_lim:d_theta:theta_lim];

ls = sqrt(b^2+l^2-2*b*l*sin(theta));
h = b*l*cos(theta)./ls;
fs = ks*(ls-d);
ts = fs.*h;

fm = b*ks.*(ls-d)./ls;
ls0 = sqrt(b^2+l^2);
ks0 = mg*ls0/(b*(ls0-d));

plot(theta,fm,'r')