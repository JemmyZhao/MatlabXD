% Platform Data
load('pdata3.mat');
p_acc = ACC1(:,4:6);
p_gyro = GYR1(:, 4:6);
p_time_acc = ACC1(:,3)/1000000;
p_time_gyro = GYR1(:,3)/1000000;
load('cdata3.mat');
g_acc = ACC1(:,4:6);
g_gyro = GYR1(:,4:6);
g_time_acc = ACC1(:,3)/1000000;
g_time_gyro = GYR1(:, 3)/1000000;
clearvars -except p_acc p_gyro p_time_acc p_time_gyro g_acc g_gyro g_time_acc g_time_gyro
% 去除常量误差
p_acc = p_acc - mean(p_acc);
p_gyro = p_gyro - mean(p_gyro);
g_acc = g_acc - mean(g_acc);
g_gyro = g_gyro - mean(g_gyro);

p_time_acc = p_time_acc - p_time_acc(1);  %sec
p_time_gyro = p_time_gyro - p_time_gyro(1);
g_time_acc = g_time_acc - g_time_acc(1);
g_time_gyro = g_time_gyro - g_time_gyro(1);

%保存原始数据
p_acc_raw = p_acc;
p_gyro_raw = p_gyro;
g_acc_raw = g_acc;
g_gyro_raw = g_gyro;
p_time_acc_raw = p_time_acc;
p_time_gyro_raw = p_time_gyro;
g_time_acc_raw = g_time_acc;
g_time_gyro_raw = g_time_gyro;

% 能量
p_acc_power = p_acc.^2;
p_gyro_power = p_gyro.^2;
g_acc_power = g_acc.^2;
g_gyro_power = g_gyro.^2;

p_acc_power_means = mean(p_acc_power).*ones(length(p_acc_power),3);
p_gyro_power_means = mean(p_gyro_power).*ones(length(p_gyro_power),3);
g_acc_power_means = mean(g_acc_power).*ones(length(g_acc_power),3);
g_gyro_power_means = mean(g_gyro_power).*ones(length(g_gyro_power),3);


% 计算时间间隔
p_dt_acc = zeros(length(p_acc),1);
for i = 2:length(p_dt_acc)
    p_dt_acc(i) = p_time_acc(i) - p_time_acc(i-1);
end
p_dt_acc(1) = p_dt_acc(2);
p_dt_gyro = zeros(length(p_gyro),1);
for i = 2:length(p_dt_gyro)
    p_dt_gyro(i) = p_time_gyro(i) - p_time_gyro(i-1);
end
p_dt_gyro(1) = p_dt_gyro(2);

g_dt_acc = zeros(length(g_acc),1);
for i = 2:length(g_dt_acc)
    g_dt_acc(i) = g_time_acc(i) - g_time_acc(i-1);
end
g_dt_acc(1) = g_dt_acc(2);
g_dt_gyro = zeros(length(g_gyro),1);
for i = 2:length(g_dt_gyro)
    g_dt_gyro(i) = g_time_gyro(i) - g_time_gyro(i-1);
end
g_dt_gyro(1) = g_dt_gyro(2);

% 提取振动起始点
start_time = 70;
i = 1;
while(p_time_acc(i,1) < start_time)
    i = i+1;
end
p_acc_head = i;
p_acc_head_time = p_time_acc(i);
i = 1;
while(p_time_gyro(i,1) < start_time)
    i = i+1;
end
p_gyro_head = i;
p_gyro_head_time = p_time_gyro(i);

i = 1;
while(g_time_acc(i,1) < start_time)
    i = i+1;
end
g_acc_head = i;
g_acc_head_time = g_time_acc(i);
i = 1;
while(g_time_gyro(i,1) < 70)
    i = i+1;
end
g_gyro_head = i;
g_gyro_head_time = g_time_gyro(i);

% 提取数据段
len = 10000;
p_dt_acc_mean = mean(p_dt_acc)*ones(len,1);
p_dt_gyro_mean = mean(p_dt_gyro)*ones(len,1);
g_dt_acc_mean = mean(g_dt_acc)*ones(len,1);
g_dt_gyro_mean = mean(g_dt_gyro)*ones(len,1);

p_acc = p_acc(p_acc_head:p_acc_head+len, :);
p_gyro = p_gyro(p_gyro_head:p_gyro_head+len,:);
p_time_acc = p_time_acc(p_acc_head:p_acc_head+len,:) - p_time_acc(p_acc_head);
p_time_gyro = p_time_gyro(p_gyro_head:p_gyro_head+len,:) - p_time_gyro(p_gyro_head);
g_acc = g_acc(g_acc_head:g_acc_head+len, :);
g_gyro = g_gyro(g_gyro_head:g_gyro_head+len,:);
g_time_acc = g_time_acc(g_acc_head:g_acc_head+len,:) - g_time_acc(g_acc_head);
g_time_gyro = g_time_gyro(g_gyro_head:g_gyro_head+len,:) - g_time_gyro(g_gyro_head);

p_acc_cal = p_acc;
p_gyro_cal = p_gyro;
p_time_acc_cal = p_time_acc;
p_time_gyro_cal = p_time_gyro;
g_acc_cal = g_acc;
g_gyro_cal = g_gyro;
g_time_acc_cal = g_time_acc;
g_time_gyro_cal = g_time_gyro;


% 能量
p_acc_power = p_acc.^2;
p_gyro_power = p_gyro.^2;
g_acc_power = g_acc.^2;
g_gyro_power = g_gyro.^2;

p_acc_power_means = mean(p_acc_power).*ones(length(p_acc_power),3);
p_gyro_power_means = mean(p_gyro_power).*ones(length(p_gyro_power),3);
g_acc_power_means = mean(g_acc_power).*ones(length(g_acc_power),3);
g_gyro_power_means = mean(g_gyro_power).*ones(length(g_gyro_power),3);

% 计算时间间隔
p_dt_acc = zeros(length(p_acc),1);
for i = 2:length(p_dt_acc)
    p_dt_acc(i) = p_time_acc(i) - p_time_acc(i-1);
end
p_dt_acc(1) = p_dt_acc(2);
p_dt_gyro = zeros(length(p_gyro),1);
for i = 2:length(p_dt_gyro)
    p_dt_gyro(i) = p_time_gyro(i) - p_time_gyro(i-1);
end
p_dt_gyro(1) = p_dt_gyro(2);

g_dt_acc = zeros(length(g_acc),1);
for i = 2:length(g_dt_acc)
    g_dt_acc(i) = g_time_acc(i) - g_time_acc(i-1);
end
g_dt_acc(1) = g_dt_acc(2);
g_dt_gyro = zeros(length(g_gyro),1);
for i = 2:length(g_dt_gyro)
    g_dt_gyro(i) = g_time_gyro(i) - g_time_gyro(i-1);
end
g_dt_gyro(1) = g_dt_gyro(2);

p_dt_acc_mean = mean(p_dt_acc)*ones(length(p_dt_acc),1);
p_dt_gyro_mean = mean(p_dt_gyro)*ones(length(p_dt_gyro),1);
g_dt_acc_mean = mean(g_dt_acc)*ones(length(g_dt_acc),1);
g_dt_gyro_mean = mean(g_dt_gyro)*ones(length(g_dt_gyro),1);

%% 
% fft
p_fs_acc = 1/p_dt_acc_mean(1);
p_fs_gyro = 1/p_dt_gyro_mean(1);
g_fs_acc = 1/g_dt_acc_mean(1);
g_fs_gyro = 1/g_dt_gyro_mean(1);

p_t_acc = (0:len - 1)*p_dt_acc_mean(1);
p_t_gyro = (0:len - 1)*p_dt_gyro_mean(1);
g_t_acc = (0:len-1)*g_dt_acc_mean(1);
g_t_gyro = (0:len-1)*g_dt_gyro_mean(1);

p_ACC = fft(p_acc);
p2 = abs(p_ACC*10/len);
p_a_acc = p2(1:len/2+1,:);
p_a_acc(2:end-1,:) = 2*p_a_acc(2:end-1,:);
p_f_acc = p_fs_acc*(0:(len/2))/len;

p_GYRO = fft(p_gyro);
p2 = abs(p_GYRO*10/len);
p_a_gyro = p2(1:len/2+1,:);
p_a_gyro(2:end-1,:) = 2*p_a_gyro(2:end-1,:);
p_f_gyro = p_fs_gyro*(0:(len/2))/len;

g_ACC = fft(g_acc);
g2 = abs(g_ACC*10/len);
g_a_acc = g2(1:len/2+1,:);
g_a_acc(2:end-1,:) = 2*g_a_acc(2:end-1,:);
g_f_acc = g_fs_acc*(0:(len/2))/len;

g_ACC = fft(g_acc);
g2 = abs(g_ACC*10/len);
g_a_acc = g2(1:len/2+1,:);
g_a_acc(2:end-1,:) = 2*g_a_acc(2:end-1,:);
g_f_acc = g_fs_acc*(0:(len/2))/len;

g_GYRO = fft(g_gyro);
g2 = abs(g_GYRO*10/len);
g_a_gyro = g2(1:len/2+1,:);
g_a_gyro(2:end-1,:) = 2*g_a_gyro(2:end-1,:);
g_f_gyro = g_fs_gyro*(0:(len/2))/len;

%%
figure(1)
ax_acc_x = subplot(2,3,1);
ax_acc_y = subplot(2,3,2);
ax_acc_z = subplot(2,3,3);
ax_gyro_x = subplot(2,3,4);
ax_gyro_y = subplot(2,3,5);
ax_gyro_z = subplot(2,3,6);
plot(ax_acc_x, p_f_acc, p_a_acc(:,1),'r',g_f_acc, g_a_acc(:,1), 'b');
plot(ax_acc_y, p_f_acc, p_a_acc(:,2),'r', g_f_acc, g_a_acc(:,2), 'b');
plot(ax_acc_z, p_f_acc, p_a_acc(:,3),'r', g_f_acc, g_a_acc(:,3), 'b');
plot(ax_gyro_x, p_f_gyro, p_a_gyro(:,1),'r', g_f_gyro, g_a_gyro(:,1), 'b');
plot(ax_gyro_y, p_f_gyro, p_a_gyro(:,2),'r', g_f_gyro, g_a_gyro(:,2), 'b');
plot(ax_gyro_z, p_f_gyro, p_a_gyro(:,3),'r', g_f_gyro, g_a_gyro(:,3), 'b');
% 
% plot(ax_acc_x, g_f_acc, g_a_acc(:,1), 'b');
% plot(ax_acc_y, g_f_acc, g_a_acc(:,2), 'b');
% plot(ax_acc_z, g_f_acc, g_a_acc(:,3), 'b');
% plot(ax_gyro_x, g_f_gyro, g_a_gyro(:,1), 'b');
% plot(ax_gyro_y, g_f_gyro, g_a_gyro(:,2), 'b');
% plot(ax_gyro_z, g_f_gyro, g_a_gyro(:,3), 'b');

title(ax_acc_x, '加速度 X');
xlabel(ax_acc_x, '频率/Hz');
ylabel(ax_acc_x, '幅度/m/ss');
legend(ax_acc_x, '飞机','云台');

title(ax_acc_y, '加速度 Y');
xlabel(ax_acc_y, '频率/Hz');
ylabel(ax_acc_y, '幅度/m/ss');
legend(ax_acc_y, '飞机','云台');

title(ax_acc_z, '加速度 Z');
xlabel(ax_acc_z, '频率/Hz');
ylabel(ax_acc_z, '幅度/m/ss');
legend(ax_acc_z, '飞机','云台');

title(ax_gyro_x, '陀螺仪 X');
xlabel(ax_gyro_x, '频率/Hz');
ylabel(ax_gyro_x, '幅度');
legend(ax_gyro_x, '飞机','云台');

title(ax_gyro_y, '陀螺仪 Y');
xlabel(ax_gyro_y, '频率/Hz');
ylabel(ax_gyro_y, '幅度');
legend(ax_gyro_y, '飞机','云台');

title(ax_gyro_z, '陀螺仪 Z');
xlabel(ax_gyro_z, '频率/Hz');
ylabel(ax_gyro_z, '幅度');
legend(ax_gyro_z, '飞机','云台');
% plot(ax1, g_time_acc, g_acc_power(:,1),'g', g_time_acc, g_acc_power_means(:,1), 'g');hold off;
% plot(ax2, g_dt_acc,'r');hold on;
% plot(ax2, g_dt_acc_mean,'r');

figure(2)
ax_acc_x = subplot(2,3,1);
ax_acc_y = subplot(2,3,2);
ax_acc_z = subplot(2,3,3);
ax_gyro_x = subplot(2,3,4);
ax_gyro_y = subplot(2,3,5);
ax_gyro_z = subplot(2,3,6);
plot(ax_acc_x, p_time_acc_raw, p_acc_raw(:,1),'r', g_time_acc_raw, g_acc_raw(:,1), 'b');
plot(ax_acc_y, p_time_acc_raw, p_acc_raw(:,2),'r', g_time_acc_raw, g_acc_raw(:,2), 'b');
plot(ax_acc_z, p_time_acc_raw, p_acc_raw(:,3),'r', g_time_acc_raw, g_acc_raw(:,3), 'b');
plot(ax_gyro_x, p_time_gyro_raw, p_gyro_raw(:,1),'r', g_time_gyro_raw, g_gyro_raw(:,1), 'b');
plot(ax_gyro_y, p_time_gyro_raw, p_gyro_raw(:,2),'r', g_time_gyro_raw, g_gyro_raw(:,2), 'b');
plot(ax_gyro_z, p_time_gyro_raw, p_gyro_raw(:,3),'r', g_time_gyro_raw, g_gyro_raw(:,3), 'b');

figure(3)
ax_acc_x = subplot(2,3,1);
ax_acc_y = subplot(2,3,2);
ax_acc_z = subplot(2,3,3);
ax_gyro_x = subplot(2,3,4);
ax_gyro_y = subplot(2,3,5);
ax_gyro_z = subplot(2,3,6);
plot(ax_acc_x, p_time_acc_cal, p_acc_cal(:,1),'r', g_time_acc_cal, g_acc_cal(:,1), 'b');
plot(ax_acc_y, p_time_acc_cal, p_acc_cal(:,2),'r', g_time_acc_cal, g_acc_cal(:,2), 'b');
plot(ax_acc_z, p_time_acc_cal, p_acc_cal(:,3),'r', g_time_acc_cal, g_acc_cal(:,3), 'b');
plot(ax_gyro_x, p_time_gyro_cal, p_gyro_cal(:,1),'r', g_time_gyro_cal, g_gyro_cal(:,1), 'b');
plot(ax_gyro_y, p_time_gyro_cal, p_gyro_cal(:,2),'r', g_time_gyro_cal, g_gyro_cal(:,2), 'b');
plot(ax_gyro_z, p_time_gyro_cal, p_gyro_cal(:,3),'r', g_time_gyro_cal, g_gyro_cal(:,3), 'b');










