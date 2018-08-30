function [Aq2c, Ag2c, g_qut, g_gim, g_cam] = get_rot_matrix(file)
data = load(file);
start = 1000;
IMU0 = data.IMU(start:end,:);
IMU1 = data.IMU1(start:end,:);
IMU2 = data.IMU2(start:end,:);

[imu0,imu1,imu2] = imu_align_time(IMU0, IMU1, IMU2);

g_gim = imu0(:,3:5);
g_qut = imu1(:,3:5);
g_cam = imu2(:,3:5);

Aq2c = cal_rot_pinv(g_qut, g_cam);
Ag2c = cal_rot_pinv(g_gim, g_cam);

