IMU = IMU(:,2:end);
IMU(:,1) = IMU(:,1)/1000000;
time_bias = IMU(1,1);
IMU(:,1) = IMU(:,1) - time_bias;
time = IMU(end,1)-IMU(1,1);
freq = length(IMU(:,1))/time;
sample_time = 1/freq;