function dcm = euler2dcm_zxy(euler)
sx = sin(euler(1));
cx = cos(euler(1));
sy = sin(euler(2));
cy = cos(euler(2));
sz = sin(euler(3));
cz = cos(euler(3));
dcm = [cz*cy-sz*sx*sy  -sz*cx  cz*sy+sz*sx*cy;
       sz*cy+cz*sx*sy  cz*cx  sz*sy-cz*sx*cy;
       -cx*sy          sx           cx*cy;];

