function ROT = PRYROT(dx, dy, dz, enc_x, enc_y, enc_z)
%在pitch，roll，yaw电机编码器为enc_p, enc_r, enc_y时， 当云台pitch，roll，yaw轴电机同时旋转dp，dr，dy，计算旋转矩阵rot
%如果当前姿态用矩阵A表示，则旋转后的矩阵为 A' = ROT*A
% input: dx, dy, dz ：roll，pitch，yaw轴电机旋转的微分量(rad)
%        enc_x, enc_y, enc_z: roll, pitch, yaw 轴电机角度(rad)
% output: ROT: 3x3旋转矩阵
a = sin(enc_y)*dx - cos(enc_y)*cos(enc_x)*dz;
b = dy - sin(enc_x)*dz;
c = -cos(enc_y)*dx - sin(enc_y)*cos(enc_x)*dz;
ROT = [ 1   a   b;
        -a  1   c;
        -b  -c  1;];
end