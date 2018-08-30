T = 50;
T1 = 0.2;
T2 = 15;
A = 1;
b = 1;
t = 0:0.003:10;
y =b + A*sin(2*pi*T*t);
A1 = 1;
y1 = A1*cos(2*pi*T1*t);
A2 = 1;
y2 = A2*sin(2*pi*T2*t);

z = y + y1 + y2;
plot(t,z);

