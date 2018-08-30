function B = pitchRot(A, angle)
rot = [ 1     0           0;
        0  cos(angle) -sin(angle);
        0  sin(angle) cos(angle);];
B = rot