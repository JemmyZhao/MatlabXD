function y = get_sin_excitation(fs, fs_periods, sample_time)
w = 2*pi*fs;
tss = fs_periods./fs;
t_max = sum(tss);
t = 0:sample_time:t_max;
y = [];
for i = 1:length(fs)
    tt = 0:0.001:tss(i);
    z = sin(w(i)*tt);
    y = [y,z];
end

