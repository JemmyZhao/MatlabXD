s = 10e-20;
r = 10;
b = 0;
xlim = 10;
x = [-xlim:0.1:xlim];

y = s./(x+r/2-b)+s./(r/2+b-x)-4/r;
sumy = sum(y(20:120));

plot(x,y);