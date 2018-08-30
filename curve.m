n = [1 2 3 4 5];
max_angle = 40;
angle = [0:0.1:max_angle];
for i = 1:5
y[i] = (angle./max_angle).^n[i];
end
plot(y)