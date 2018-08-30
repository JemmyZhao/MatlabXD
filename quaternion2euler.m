function [x,y,z] = quaternion2euler(quat)

y = asin(2*quat(2)*quat(4)-2*quat(1)*quat(3));
x = atan2(2*quat(3)*quat(4)+2*quat(1)*quat(2), -2*quat(2)*quat(2)-2*quat(3)*quat(3)+1);
z = -atan2(2*quat(2)*quat(3)+2*quat(1)*quat(4), -2*quat(3)*quat(3)-2*quat(4)*quat(4)+1);
