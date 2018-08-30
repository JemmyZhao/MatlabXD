figure(1)
bode(ssyt1,'r');hold on
bode(ssyt2,'g');hold on
bode(ssyt3,'b');hold on
bode(ssyt4,'c');hold off

figure(2)
step(ssyt1,'r');hold on
step(ssyt2,'g');hold on
step(ssyt3,'b');hold on
step(ssyt4,'c');hold off
