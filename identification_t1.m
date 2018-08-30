load('id_data_t1.mat');
data = iddata(id_data(:,2), id_data(:,1), 0.001);
m = tfest(data, 2, 0);

bode(m);
b = bandwidth(m);