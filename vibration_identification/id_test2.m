
opts = bodeoptions('cstprefs');
opts.FreqUnits = 'Hz';
opts.FreqScale = 'linear';
opts.Xlim = [0.1 50];
opts.Grid = 'on';
opts.PhaseMatching = 'on';


f1 = figure(1);
bodeplot(ss2,'g',opts);hold on
% legend('ssp','ssr','ssy')