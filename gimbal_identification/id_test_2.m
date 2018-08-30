figure(1)
bode(ss002,'r');hold on
bode(ss002h,'g');hold on
bode(ss005h,'b');hold on
bode(ss005hh,'y');hold on
bode(ss005hhe,'c');hold off

figure(2)
step(ss002,'r');hold on
step(ss002h,'g');hold on
step(ss005h,'b');hold on
step(ss005hh,'y');hold on
step(ss005hhe,'c');hold off