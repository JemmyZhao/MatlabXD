function [x,y] = get_gyro_in_out(imu)

in = imu.IMU1(20:end,:);
out = imu.IMU(20:end,:);
in(:,2) = in(:,2)./1000000;
out(:,2) = out(:,2)./1000000;
i_in = 1;
i_out = 1;
t_in = in(1,2);
t_out = out(1,2);
for i=1:length(in)
    if t_out - t_in > 0.001
        i_in = i_in + 1;
        t_in = in(i_in,2);
    end
    if t_in - t_out > 0.001
        i_out = i_out + 1;
        t_out = out(i_out,2);
    end
    if(abs(t_in-t_out)<0.001)
%         if t_in > t_out
%             i_out = i_out + 1;
%         end
        break;
    end
end
            
scale = 0.98;
x = in(i_in:end,:);
y = out(i_out:end,:);
len = scale * length(x);

x = x(1:len,2:5);
y = y(1:len,2:5);
x(:,1) = x(:,1) - x(1,1);
y(:,1) = y(:,1) - y(1,1);


