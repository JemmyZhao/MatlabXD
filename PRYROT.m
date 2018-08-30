function ROT = PRYROT(dx, dy, dz, enc_x, enc_y, enc_z)
%��pitch��roll��yaw���������Ϊenc_p, enc_r, enc_yʱ�� ����̨pitch��roll��yaw����ͬʱ��תdp��dr��dy��������ת����rot
%�����ǰ��̬�þ���A��ʾ������ת��ľ���Ϊ A' = ROT*A
% input: dx, dy, dz ��roll��pitch��yaw������ת��΢����(rad)
%        enc_x, enc_y, enc_z: roll, pitch, yaw �����Ƕ�(rad)
% output: ROT: 3x3��ת����
a = sin(enc_y)*dx - cos(enc_y)*cos(enc_x)*dz;
b = dy - sin(enc_x)*dz;
c = -cos(enc_y)*dx - sin(enc_y)*cos(enc_x)*dz;
ROT = [ 1   a   b;
        -a  1   c;
        -b  -c  1;];
end