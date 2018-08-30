function [y0, y1, y2] = imu_align_time(imu0, imu1, imu2)
start = 20;
x0 = imu0(start:end,:);
x1 = imu1(start:end,:);
x2 = imu2(start:end,:);
x0(:,2) = x0(:,2)/1000000;
x1(:,2) = x1(:,2)/1000000;
x2(:,2) = x2(:,2)/1000000;
len = min([length(x0), length(x1), length(x2)]);
x0 = x0(1:len,:);
x1 = x1(1:len,:);
x2 = x2(1:len,:);

i0 = 1;
i1 = 1;
i2 = 1;

t0 = x0(1,2);
t1 = x1(1,2);
t2 = x2(1,2);

for i=1:len
    if t1 - t0 > 0.0006
        i0 = i0 + 1;
        t0 = x0(i0,2);
    end
    if t0 - t1 > 0.0006
        i1 = i1 + 1;
        t1 = x1(i1,2);
    end
    if abs(t0-t1)<0.0006
        break
    end
end

x0 = x0(i0:end,:);
x1 = x1(i1:end,:);

i0 = 1;
i1 = 1;
i2 = 1;

t0 = x0(1,2);
t1 = x1(1,2);
t2 = x2(1,2);

for i=1:len
    if t2 - t0 > 0.001
        i0 = i0 + 1;
        t0 = x0(i0,2);
    end
    if t0 - t2 > 0.001
        i2 = i2 + 1;
        t2 = x2(i2,2);
    end
    if abs(t0-t2)<0.001
        break
    end
end

x0 = x0(i0:end,:);
x1 = x1(i0:end,:);
x2 = x2(i2:end,:);

len = min([length(x0), length(x1), length(x2)]);
y0 = x0(1:len,:);
y1 = x1(1:len,:);
y2 = x2(1:len,:);


