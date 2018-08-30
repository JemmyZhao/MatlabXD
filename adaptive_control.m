% 云台
b = 0;
i = 1;
A = [0 1; 0 -b];
B = [0; 1/i];
C = [1 0;];
D = [0];
sys = ss(A,B,C,D);
sys_tf = tf(sys);
sys_zpk = zpk(sys);

% 离散系统
sys_disc = tf(sys_tf.Numerator, sys_tf.Denominator, 0.001, 'ioDelay', 1);

G = sys;

% 加入惯量不确定性量
bw_i = ureal('bw_i', i, 'Percentage', 60); 
G_u = tf(1, [bw_i, b, 0]);
% 加入频率不确定量
Gnorm = G_u;
% 5% erro at 9rad/s and 1000% at hight freq
w = makeweight(0.01, 9, 1.5);
delta = ultidyn('Delta',[1,1]);
G_uu = Gnorm*(1+w*delta);

% Controller design
C1 = tunablePID('C','PID');
d = AnalysisPoint('d');


T1 = feedback(G_u*d*C1, 1);
T1.InputName = 'r';
T1.OutputName = 'y';

Rtrack = TuningGoal.Tracking('r','y',1,0.001);
Rreject = TuningGoal.Gain('d','y', 0.55);

s = tf('s');
R1 = TuningGoal.LoopShape('d',100/s);
R2 = TuningGoal.Margins('d', 7.6, 45);
R3 = TuningGoal.Poles('d', 0, 0, 1e3);

[CL, fSoft, ~, Info] = systune(T1,[R1, R2, R3]);
showTunable(CL)

WCU = Info.wcPert;
WCU(1)
Twc = usubs(CL, WCU);
step(Twc)

tfinal =1000;
% stepplot(T1, 'b', tfinal)
% bodeplot(T1)
% S1 = getLoopTransfer(T1,'d');
% % bodeplot(S1)
% bodeplot(CL, getNominal(CL))


% input signal
[u,t] = gensig('squart', .4, 1, 0.001);
lsim(CL,getNominal(CL), u,t);


% bode(G_uu, {1e-1 1e2})
% step(sys_u_tf)
