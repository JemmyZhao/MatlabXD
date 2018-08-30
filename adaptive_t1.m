a = ureal('a', 1, 'Percentage', 60);
A = a;
B = 1;
C = 1;
D = 0;
G = ss(A,B,C,D);
C = pid(10,10,4);
sys = feedback(C*G, 1);

% input signal
[u,t] = gensig('squart', 10, 40, 0.01);
lsim(sys, u,t);
% bodeplot(sys)
% bodeplot(sys)
