gd1 = load('gimbal_data.mat');

gimbal_data = gd1.gimbaldata;

gx1 = gimbal_data(:,6)/10000;
gy1 = gimbal_data(:,8)/10000;
gz1 = gimbal_data(:,10)/10000;

gx2 = gimbaldata2(:,2)/10000;
gy2 = gimbaldata2(:,3)/10000;
gz2 = gimbaldata2(:,4)/10000;

t1 = gimbal_data(:,1)/1000000;
t2 = gimbaldata2(:,1)/1000000;

g1_sim = [t1, gx1, gy1, gz1];
g2_sim = [t2, gx2, gy2, gz2];