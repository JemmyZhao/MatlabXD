load('id_pry.mat');
opts = bodeoptions('cstprefs');
opts.FreqUnits = 'Hz';
opts.FreqScale = 'linear';
opts.Xlim = [0.1 30];
opts.Grid = 'on';
opts.PhaseMatching = 'on';

f1 = figure(1);
bodeplot(ssp,'g',opts);hold on
bode(ssr,'b');hold on
bode(ssy,'c');hold on
legend('ssp','ssr','ssy')


f2 = figure(2);
step(ssp,'g');hold on
step(ssr,'b');hold on
step(ssy,'c');hold off