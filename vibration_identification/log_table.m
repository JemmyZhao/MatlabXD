function [fs,w,tp,time] = log_table(num, max_freq, center_freq, periods)
max_mi = log(max_freq)/log(center_freq);
mi = (linspace(0, max_mi, num))';
fs = center_freq.^mi;
w = fs*2*pi;
ts = 1./fs;
tp = ts * periods;
time = sum(tp);