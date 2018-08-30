num=[1]; %set the numerator in a matrix
den=[1 1.5]; %set the denominator in a matrix
Transfer_Function=tf(num,den); % use the tf function to set the transfer function
[mag,phase,wout] = bode(Transfer_Function);                     % Get Plot Data
mag = squeeze(mag);                                             % Reduce (1x1xN) Matrix To (1xN)
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;                                      % Calculate Power Of Ratio Of ¡®mag/max(mag)¡¯
dB3 = interp1(magr2, [wout phase mag], 0.5, 'spline');          % Find Frequency & Phase & Amplitude of Half-Power (-3 dB) Point
figure(1)
subplot(2,1,1)
semilogx(wout, 20*log10(mag), '-b',  dB3(1), 20*log10(dB3(3)), '+r', 'MarkerSize',10)
grid
subplot(2,1,2)
semilogx(wout, phase, '-b',  dB3(1), dB3(2), '+r', 'MarkerSize',10)
grid