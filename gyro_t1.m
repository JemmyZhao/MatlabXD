load('gyro_data_3.mat')
gyro = gyrodatat3(:,2:end)/10000;
t = linspace(0,length(gyro)/1000,length(gyro));
fs = 2000;

% È¥³ýÆ¯ÒÆ
gyro_cal = gyro(1000:5000,:);
gyro_bias = mean(gyro_cal);
gyro = gyro - gyro_bias;
gyro_cal = gyro_cal - gyro_bias;

% Kalman
arx3 = ar(gyro_cal(:,1),1,'ls','now');
ary3 = ar(gyro_cal(:,2),1);
arz3 = ar(gyro_cal(:,3),1);
AX = [1];%-arx3.A(2)];
BX = [1];
CX = [1];
RX = arx3.NoiseVariance*50;
QX = arx3.NoiseVariance*eye(1);

PX = eye(1);
T = [1];
x = [gyro(1,1)];
g_x = zeros(length(gyro), 1);
g_x(1) = x(1);
for i = 2:length(gyro)
    z = gyro(i);
    x_ = AX*x;
    p_ = AX*PX*AX'+ QX;
    k = p_*CX'/(CX*p_*CX'+RX);
    x = x_+k*(z-CX*x_);
    PX = (eye(1)-k*CX)*p_;
    g_x(i) = x(1);
end

% Filter Design
% FIR
fc = 30;
Wn = (2/fs)*fc;
order = 30;
num = linspace(0,order+1,order+1);
b =  fir1(order,Wn,'low',kaiser(order+1));
fvtool(b,1,'Fs',fs);

fc1 = 10;
Wn1 = (2/fs)*fc1;
b1 = fir1(order,Wn1,'low',kaiser(order+1));
% fvtool(b1,1,'Fs',fs);
gyrox_fir = filter(b,1,gyro(:,1));
sum_b = sum(b);
gyrox_fird = filter(Num,1,gyro(:,1));
num_fird = linspace(0,length(Num),length(Num));

figure
sig_fig = subplot(1,2,1);
fil_fig = subplot(1,2,2);
plot(sig_fig, t,gyro(:,1),'g',t,gyrox_fir,'r', t, gyrox_fird,'b');
plot(fil_fig, num,b,'r',num, b1,'b');

fil = [0.1982682510288,  0.01317451456321,  0.01352352638704,  0.01395886470839,   0.01425476466435,  0.01468733085144,   0.0149493122849,  0.01530341271598,    0.01538898716552,  0.01553199223601,  0.01590283584766,  0.01595248622156,    0.01609729222196,   0.0162118368039,  0.01618070595761,  0.01623016569905,    0.01618070595761,   0.0162118368039,  0.01609729222196,  0.01595248622156,    0.01590283584766,  0.01553199223601,  0.01538898716552,  0.01530341271598,     0.0149493122849,  0.01468733085144,  0.01425476466435,  0.01395886470839,    0.01352352638704,  0.01317451456321,   0.1982682510288]

    





