x = filterdata1(2:end,:);
x_raw = x(:,7);
x_fir10 = x(:,3);
x_fir20 = x(:,2);
x_fir30 = x(:,4);
x_lp = x(:,6);
time = x(:,1)./1000000;
time_2k = time./2;
x_sim = [time x_raw x_fir10 x_lp];


figure,
plot(x_raw, 'r');hold on;
plot(x_fir10, 'g');hold on;
plot(x_lp, 'b');hold off;