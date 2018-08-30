[Aqc1, Agc1, gq, gg, gc] = get_rot_matrix('LOG1_0510.mat');

gq = gq - mean(gq);
gg = gg - mean(gg);
gc = gc - mean(gc);

t = 0:0.001:(length(gc)-1)/1000;

ggc = rot_signal(Agc, gg);
ggc = ggc - mean(ggc);
gqc = rot_signal(Aqc, gq);
gqc = gqc - mean(gqc);

gcsim = [t' gc];
gqsim = [t' gqc];
ggsim = [t' ggc];
