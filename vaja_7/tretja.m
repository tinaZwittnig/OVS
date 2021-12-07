%tretja
slika = loadImage("cameraman-256x256-08bit.raw",[256,256], 'uint8');
Sx = [-1 0 1;
    -2 0 2;
    -1 0 1];
Sy = [-1 -2 -1;
    0 0 0;
    1 2 1];

gx  = spatialFiltering('kernel', slika, Sx);
minimal_x = min(min(gx));
mks = max(max(gx + abs(minimal_x)));
gx_p = (gx + abs(minimal_x))*255/mks;
Gx = displayImage(gx_p , 'filter z Sx filtrom');
gy  = spatialFiltering('kernel', slika, Sy);
minimal_g = min(min(gy));
mks_g = max(max(gy + abs(minimal_g)));
gy_p = (gy + abs(minimal_g))*255/mks_g;
Gy = displayImage(gy_p, 'filter z Sy filtrom');

Gxy = sqrt(gy.^2+gx.^2);
Gxy;
Gxxyy = displayImage(Gxy, 'filter z obema');
max(max(Gxy))
min(min(Gxy))
saveas(Gx, 'porocilo/gx.png')
saveas(Gy, 'porocilo/gy.png')
saveas(Gxxyy, 'porocilo/Gxy.png')


phi = atan(gy./gx);
minimal = min(min(phi));
mks = max(max(phi + abs(minimal)));
slika = (phi + abs(minimal))*255/mks;
Phi = displayImage(slika, 'fazna');
saveas(Phi,'porocilo/phi.png')