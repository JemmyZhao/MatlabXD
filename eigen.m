a = [0 1; 1 -0.1];
% eigen
e = eig(a);
[v,d] = eig(a);

% controllability
A = [1 1; 0 2];
B = [0; 1];
C = [1 0; 0 1];
D = 0;
sys = ss(A,B,C,D);
co = ctrb(A,B);
% if ctrl == n : controllable
ctrl = rank(co);

