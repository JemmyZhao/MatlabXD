% acc = m[0.0074 0.1181 9.7129;
%        0.0971 9.6543 -1.6992;
%        0.3687 -9.7806 -1.2074;
%        0.2723 0.8302 -9.9916;
%        9.8747 0.0301 0.7856;
%        -9.6343 0.1852 0.4189];
%stm32 calibration result:
% x_off:0.119325 y_off:-0.025325 z_off:-0.230245 x_diag:0.999342 y_diag:0.999786 z_diag:1.002028
% stm_cal = [0.119325 -0.025325 -0.230245 0.999342 0.999786 1.002028];
% acc1 = [
% 0.853901        1.109164        9.472885
% 0.313303        -9.841979       -0.212538
% 0.079366        9.778908        0.296520
% -9.630239       -1.222046       -0.235156
% 9.743190        -1.835191       0.538686
% 1.349291        -1.634745       -9.816406
% ];
% 
% x = acc1(:,2);
% y = -4*acc1(:,1);
% z = acc1(:,3);
x = m(:,1);
y = m(:,2);
z = m(:,3);

D = [x.^2   y.^2    z.^2    2*x     2*y     2*z];
v = inv(D'*D)*D'*ones(length(D),1);
% v = [a b c g h i]
% o = [ a/g, b/h, c/i ]T
% G = 1 + g2/a + h2/b + i2/c ¡ú g = [ sqrt(a/G) sqrt(b/G) sqrt(c/G) ]T
o = [v(4)/v(1) v(5)/v(2) v(6)/v(3)]';
G = 1 + v(4)^2/v(1) + v(5)^2/v(2) + v(6)^2/v(3);
g = [sqrt(v(1)/G) sqrt(v(2)/G) sqrt(v(3)/G)]';
ls_cal = [-o' g'];

ls_stm_err = ls_cal - stm_cal;

figure(1);
scatter3(acc(:,1),acc(:,2),acc(:,3))
lim = 15;
xlim([-lim lim]);
ylim([-lim lim]);
zlim([-lim lim]);

%draw fit
mind = min( [ x y z ] );
maxd = max( [ x y z ] );
nsteps = 50;
step = ( maxd - mind ) / nsteps;
[ x, y, z ] = meshgrid( linspace( mind(1) - step(1), maxd(1) + step(1), nsteps ), linspace( mind(2) - step(2), maxd(2) + step(2), nsteps ), linspace( mind(3) - step(3), maxd(3) + step(3), nsteps ) );

Ellipsoid = v(1) *x.*x +   v(2) * y.*y + v(3) * z.*z + ...
          2*v(4) *x    + 2*v(5)*y    + 2*v(6) * z;
p = patch( isosurface( x, y, z, Ellipsoid, 1 ) );
hold off;
set( p, 'FaceColor', 'none', 'EdgeColor', 'g' );
view( -70, 40 );
axis vis3d equal;
camlight;
lighting phong;




       

