data = load('LOG1.mat');
start = 4020;
IMU0 = data.IMU(start:end,:);
IMU1 = data.IMU1(start:end,:);
IMU2 = data.IMU2(start:end,:);

[imu0,imu1,imu2] = imu_align_time(IMU0, IMU1, IMU2);

g_gim = imu0(:,3:5);
g_qut = imu1(:,3:5);
g_cam = imu2(:,3:5);

a_gim = imu0(:, 6:8);
a_qut = imu1(:, 6:8);
a_cam = imu2(:, 6:8);

Aq2c = cal_rot_pinv(g_qut, g_cam);
Ag2c = cal_rot_pinv(g_gim, g_cam);

gqc = rot_signal(Aq2c,g_qut);
ggc = rot_signal(Ag2c,g_gim);







