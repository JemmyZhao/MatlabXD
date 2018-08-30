function euler = dcm2euler_zxy(m)
x = asin(m(3,2));
y = atan2(-m(3,1), m(3,3));
z = atan2(-m(1,2), m(2,2));
euler = [x;y;z];