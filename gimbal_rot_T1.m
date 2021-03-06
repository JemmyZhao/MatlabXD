A = [0.9999815821647644, 0.00044496182817965746, 0.00605702493339777;
    -0.0004248830955475569, 0.9999943971633911, -0.0033158373553305864;
    -0.006058466620743275, 0.0033132026437669992, 0.9999761581420898;];
% 目标姿态A1
A1 = [0.6618431806564331, 0.5188708305358887, 0.54105144739151;
      -0.6102520227432251, 0.7920984625816345, -0.0131329745054245;
      -0.43538033962249756, -0.3214857578277588, 0.8408869504928589;];
A_ = inv(A1);
I = eye(3);
ddeg = 0.01;
dx = deg2rad(-20);
dy = deg2rad(9);
dz = deg2rad(-5);
% 云台构型
enc_x = deg2rad(30);
enc_y = deg2rad(30);
enc_z = deg2rad(30);
% 当前构型下的微分旋转
ROT = PRYROT(dx, dy, dz, enc_x, enc_y, enc_z);

% 当前姿态
A2 = ROT*A1;
% 从目标姿态和当前姿态计算当前构型下的微分旋转
ROT_1 = A1*(inv(A2));
% 从微分旋转矩阵获取各轴角度
dangle = pryrot2dangle(ROT_1, enc_x, enc_y, enc_z);
dangle = 180/pi*dangle;
