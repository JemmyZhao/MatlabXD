data_w_s = load('LOG2.BIN-id-l.mat');
data_b_s = load('LOG6.BIN-237409.mat');
data_w_l = load('LOG1.BIN-272868.mat');
data_b_l = load('LOG1.BIN-191533.mat');

[xws_t, yws_t] = get_gyro_in_out(data_w_s);
[xbs_t, ybs_t] = get_gyro_in_out(data_b_s);
[xwl_t, ywl_t] = get_gyro_in_out(data_w_l);
[xbl_t, ybl_t] = get_gyro_in_out(data_b_l);

xws = xws_t(:,2:end);
yws = yws_t(:,2:end);
xbs = xbs_t(:,2:end);
ybs = ybs_t(:,2:end);
xwl = xwl_t(:,2:end);
ywl = ywl_t(:,2:end);
xbl = xbl_t(:,2:end);
ybl = ybl_t(:,2:end);

