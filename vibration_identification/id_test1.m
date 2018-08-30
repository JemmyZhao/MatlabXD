tf_blxd = tf(blxd);
ss_blxd = ss(blxd);

tf_bsxd = tf(bsxd);
ss_bsxd = ss(bsxd);

tf_wlxd = tf(wlxd);
ss_wlxd = ss(wlxd);

tf_wsxd = tf(wsxd);
ss_wsxd = ss(wsxd);

tf_ss1 = tf(ss1);
figure(1)
bode(blxd,'r');hold on;
% bode(ss1,'c');hold off;