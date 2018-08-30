function IMU_SM = imu2sm(IMU)
IMU_SM = IMU(:,2:end);
IMU_SM(:,1) = IMU_SM(:,1)/1000000;
time_bias = IMU_SM(1,1);
IMU_SM(:,1) = IMU_SM(:,1) - time_bias;
time = IMU_SM(end,1)-IMU_SM(1,1);
freq = length(IMU_SM(:,1))/time;
sample_time = 1/freq;