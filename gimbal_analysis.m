b = 0;
i = 1;
A = [0 1; 0 b];
B = [0; 1/i];
C = [1 0;];
D = [0];



sys = ss(A,B,C,D);
sys_tf = tf(sys);
C = pid(1,0,0.2);
T = feedback(C*sys,1);
b = bandwidth(T);

bode(T);
