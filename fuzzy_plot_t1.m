
e = fcdata(:,3)./100;
ce = fcdata(:,2)./100;
out = fcdata(:,4)./100;

len = length(e);

start = 0;
for i=2:len
    if e(i) == -10 && ce(i) == -10
        start = i;
    end
    if start ~= 0 && e(i) >= 9.9 && ce(i) >= 9.9
        stop = i;
        break;
    end
    if abs(e(i)-e(i-1)) < 1 && abs(out(i) - out(i-1)) > 5
        out(i) = out(i-1);
    end
end

e = e(start:stop);
ce = ce(start:stop);
out = out(start:stop);
len = length(e);


tri = delaunay(e,ce);
trisurf(tri, e, ce, out)
axis vis3d
% axis off
l = light('Position',[-10 -20 10]);
set(gca,'CameraPosition',[-100 -150 100]);
lighting phong
shading interp
colorbar EastOutside

