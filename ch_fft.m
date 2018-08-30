% load all acc data
acc_all = load('acc_all');
acc_all = acc_all.all_acc;

% planform data
acc_p = 0.001*acc_all(:,7:end)/9.8;
acc_p = acc_p(1:end-24, :);

% gimbal data
acc_g = 0.001*acc_all(:,1:6)/9.8;
acc_g = acc_g(1:end-24, :);

% time
Fs = 1000;
T = 1/Fs;
L = length(acc_g);
t = (0:L-1)*T;

% fft
% gimbal
Yg = fft(acc_g);
pg2 = abs(Yg);
pg1 = pg2(1:L/2+1,:);
pg1(2:end-1,:) = 2*pg1(2:end-1,:);
% platform
Yp = fft(acc_p);
pp2 = abs(Yp/L);
pp1 = pp2(1:L/2+1,:);
pp1(2:end-1,:) = 2*pp1(2:end-1,:);

f = Fs*(0:(L/2))/L;

figure
ax1 = subplot(2,3,1);
ax2 = subplot(2,3,2);
ax3 = subplot(2,3,3);
ax4 = subplot(2,3,4);
ax5 = subplot(2,3,5);
ax6 = subplot(2,3,6);
plot(ax1, t, acc_g(:,1), 'r', t, acc_p(:,1))
title(ax1, 'Acc X')
ylabel(ax1, 'acc(g)')
xlabel(ax1, 'time(s)')
legend(ax1, 'gimbal','platform')
plot(ax2, t, acc_g(:,2), 'r', t, acc_p(:,2))
title(ax2, 'Acc Y')
ylabel(ax2, 'acc(g)')
xlabel(ax2, 'time(s)')
legend(ax2, 'gimbal','platform')
plot(ax3, t, acc_g(:,3), 'r', t, acc_p(:,3))
title(ax3, 'Acc Z')
ylabel(ax3, 'acc(g)')
xlabel(ax3, 'time(s)')
legend(ax3, 'gimbal','platform')

plot(ax4, f, pg1(:,1),'r', f, pp1(:,1))
title(ax4, 'AF Acc X')
ylabel(ax4, 'Amplitude(g)')
xlabel(ax4, 'Frequency(Hz)')
legend(ax4, 'gimbal','platform')
plot(ax5, f, pg1(:,2),'r', f, pp1(:,2))
title(ax5, 'AF Acc Y')
ylabel(ax5, 'Amplitude(g)')
xlabel(ax5, 'Frequency(Hz)')
legend(ax5, 'gimbal','platform')
plot(ax6, f, pg1(:,3),'r', f, pp1(:,3))
title(ax6, 'AF Acc Z')
ylabel(ax6, 'Amplitude(g)')
xlabel(ax6, 'Frequency(Hz)')
legend(ax6, 'gimbal','platform')
%plot(acc_g)
