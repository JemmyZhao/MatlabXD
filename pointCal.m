t = [0:0.01:2*pi]';
l1 = 4;
l2 = 6;
l3 = 8;

p1 = [l1*cos(t),l1*sin(t)];
p2 = [l2*cos(t),l2*sin(t)];
p3 = [l3*cos(t),l3*sin(t)];

a1 = 20*pi/180;
a2 = 35*pi/180;

p4 = [(l2*sin(t+a1/2)+l1*sin(a1/2))/(2*sin(a1/2)), (-l2*cos(t+a1/2)+l1*cos(a1/2))/(2*sin(a1/2))];
p5 = [(l3*sin(t+a2/2)+l1*sin(a2/2))/(2*sin(a2/2)), (-l3*cos(t+a2/2)+l1*cos(a2/2))/(2*sin(a2/2))];


lim = 20;
figure(1)
plot(p1(:,1),p1(:,2),'b');hold on;
plot(p2(:,1),p2(:,2),'b');hold on;
plot(p3(:,1),p3(:,2),'b');hold on;
plot(p4(:,1),p4(:,2),'r');hold on;
plot(p5(:,1),p5(:,2),'g');hold off;
xlim([-lim lim]);
ylim([-10 30]);
axis equal