function dcm = euler2dcm_xy(euler)
sx = sin(euler(1));
cx = cos(euler(1));
sy = sin(euler(2));
cy = cos(euler(2));

dcm = [cy 0 sy;
       sx*sy cx -sx*cy;
       -cx*sy sx cx*cy;];