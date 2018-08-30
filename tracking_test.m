d2r = pi/180;
ag0  = 0;
ag1 = 90*d2r;
w0 = 0;
w1 = 0;

kt = 3/(90*d2r);
t0 = 0;
t1 = ag1*kt;
t = [0:0.0005:t1];

c0 = ag0;
c1 = w0;
c2 = 3*(ag1-ag0)/(t1*t1) - 2*w0/t1;
c3 = (w0*t1 + 2*ag0-2*ag1)/(t1*t1*t1);

ag = (c0+c1.*t+c2.*t.*t+c3.*t.*t.*t)/d2r;
ag_d = (c1 + 2*c2*t + 3*c3*t.*t)/d2r;
ag_dd = (2*c2 + 6*c3*t)/d2r;
ag_sp = ag(100)-c0;
ag_sp_rad = ag_sp*d2r;
fig = figure(1);
plot(ag,'r');hold on;
plot(ag_d, 'g');hold on;
plot(ag_dd,'b');hold off;

