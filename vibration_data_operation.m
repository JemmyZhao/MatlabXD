IMU_B = load('LOG1.BIN_b.mat');
IMU_W = load('LOG1.BIN_w.mat');
imu_b = IMU_B.IMU;
imu_w = IMU_W.IMU;

imu_b_sm = imu2sm(imu_b);
imu_w_sm = imu2sm(imu_w);
