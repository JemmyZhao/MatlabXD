data = load('LOG2.BIN-id-l.mat');
imu_0 = data.IMU(11:end,2:end);
imu_1 = data.IMU1(10:end,2:end);
imu_0(:,1) = imu_0(:,1)/1000000;
imu_1(:,1) = imu_1(:,1)/1000000;
scale = 0.9;
len = scale*length(imu_0);
imu_0 = imu_0(1:len,:);
imu_1 = imu_1(1:len,:);
imu_0(:,1) = imu_0(:,1)-imu_0(1,1);
imu_1(:,1) = imu_1(:,1)-imu_1(1,1);

dt = imu_0(end,1)/length(imu_0);

start = 0;
stop = 0;
start_flag = 0;
stop_flag = 0;
for i = 1:length(imu_0)
    if imu_0(i,1) > 60 && start_flag == 0
        start = i;
        start_flag = 1;
        start_time = imu_0(i,1);
    end
    if imu_0(i,1) > 80 && stop_flag == 0
        stop = i;
        stop_flag = 1;
        stop_time = imu_0(i,1);
        break;
    end
end
    
gyro_0 = imu_0(start:stop,2:4);
gyro_1 = imu_1(start:stop,2:4);
gyro_0_drop_bias = gyro_0 - mean(gyro_0);
gyro_1_drop_bias = gyro_1 - mean(gyro_1);

fs = 1/0.0015;
gyro_in = gyro_1_drop_bias;
gyro_out = gyro_0_drop_bias;
winlen = size(gyro_in(:,1),1);
modalfrf(gyro_in(:,1),gyro_out(:,1),fs,winlen,'Sensor','dis');


