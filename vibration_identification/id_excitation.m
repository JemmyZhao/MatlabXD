max_freq = 500;
table_len = 70;
center_freq = 60;
periods = 20;
sample_time = 0.001;
[fs,w,tp,t] = log_table(table_len, max_freq, center_freq, periods);
y = get_sin_excitation(fs, periods, 0.001);
plot(y)
