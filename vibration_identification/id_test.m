figure(1)
bode(blxd,'r');hold on;
bode(bsxd,'g');hold on;
bode(wlxd,'b');hold on;
bode(wsxd,'c');hold on;
refline(0,10);
hold off