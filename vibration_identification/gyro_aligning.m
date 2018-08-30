gx = gyroaligningdata(:,3)/1000;
gy = gyroaligningdata(:,2)/1000;
gz = gyroaligningdata(:,4)/1000;
g1 = [gx, gy, gz];
% g1 = g1(3000,:);
A = [1    0       0;
     0 cos(pi/6) -sin(pi/6);
     0 sin(pi/6) cos(pi/6);];
B = [1    0       0;
     0 cos(pi/6) sin(pi/6);
     0 -sin(pi/6) cos(pi/6);];
g2 = rot_signal(A, g1);
g3 = rot_signal(B, g2);

noise = random('Normal', 0, 1, length(g1), 3);
g4 = g2 + noise;

x = g1';
y = g4';
Ae = y*pinv(x);

g5 = rot_signal(Ae, g1);