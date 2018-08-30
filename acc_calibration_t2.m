%least squares
acc4cal = acc4calibration/10000;


r = acc4cal(:,1).*acc4cal(:,1) + acc4cal(:,2).*acc4cal(:,2) + acc4cal(:,3).*acc4cal(:,3);
x = acc4cal(:,1);
y = acc4cal(:,2);
z = acc4cal(:,3);

D = [x.^2   y.^2    z.^2    2*x.*y  2*x.*z  2*y.*z  2*x     2*y     2*z];
I = ones(length(x),1);
I2 = eye(9);
v1 = (inv(D'*D))*(D')*I;
[ center, radii, evecs, v2, chi2 ] = ellipsoid_fit_new( [ x y z ], '' );


figure(1);
scatter3(acc4cal(:,1),acc4cal(:,2),acc4cal(:,3))
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

Ellipsoid = v1(1) *x.*x +   v1(2) * y.*y + v1(3) * z.*z + ...
          2*v1(4) *x.*y + 2*v1(5)*x.*z + 2*v1(6) * y.*z + ...
          2*v1(7) *x    + 2*v1(8)*y    + 2*v1(9) * z;
p = patch( isosurface( x, y, z, Ellipsoid, 1 ) );
hold off;
set( p, 'FaceColor', 'none', 'EdgeColor', 'g' );
view( -70, 40 );
axis vis3d equal;
camlight;
lighting phong;

