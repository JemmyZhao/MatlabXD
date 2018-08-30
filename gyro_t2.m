load('gyro_data_3.mat')
gyro = gyrodatat3(:,2:end)/10000;
t = linspace(0,length(gyro)/1000,length(gyro));

% È¥³ýÆ¯ÒÆ
gyro_cal = gyro(1000:5000,:);
gyro_bias = mean(gyro_cal);
gyro = gyro - gyro_bias;
gyro_cal = gyro_cal - gyro_bias;

%
arx3 = ar(gyro_cal(:,1),3,'ls','now');
ary3 = ar(gyro_cal(:,2),3);
arz3 = ar(gyro_cal(:,3),3);

AX = [-arx3.A(2) -arx3.A(3) -arx3.A(4);
          1          0          0     ;
          0          1          0     ;];
BX = [1;0;0];
CX = [1 0 0];
RX = arx3.NoiseVariance*10;
QX = arx3.NoiseVariance*eye(3);

PX = eye(3);
T = [1;0;0];
x = [gyro(1,1);0;0];
g_x = zeros(length(gyro), 1);
g_x(1) = x(1);
for i = 2:length(gyro)
    z = gyro(i);
    x_ = AX*x;
    p_ = AX*PX*AX'+ QX;
    k = p_*CX'/(CX*p_*CX'+RX);
    x = x_+k*(z-CX*x_);
    PX = (eye(3)-k*CX)*p_;
    g_x(i) = x(1);
end

figure 
plot(t,gyro(:,1),'r',t,g_x,'b');

    



AY = -ary3.A(2:end);
AZ = -arz3.A(2:end);





% System
% A = arx3.A;
% B = arx3.B;
% C = arx3.C;
% D = arx3.D;
% F = arx3.F;
% ts = 0.001;
% var = arx3.NoiseVariance;
% sys = idpoly(A,B,C,D,F,var,ts);
% step(sys)

