krogi = loadImage("circles-160x160-08bit.raw", [160,160],"uint8");
displayImage2(krogi, "x")

Sx = [-1 0 1;
    -2 0 2;
    -1 0 1];
Sy = [-1 -2 -1;
    0 0 0;
    1 2 1];
gx  = spatialFiltering('kernel', krogi, Sx);
minimal_x = min(min(gx));
mks = max(max(gx + abs(minimal_x)));
gx_p = (gx + abs(minimal_x))*255/mks;
gy  = spatialFiltering('kernel', krogi, Sy);
minimal_g = min(min(gy));
mks_g = max(max(gy + abs(minimal_g)));
gy_p = (gy + abs(minimal_g))*255/mks_g;

Gxy = sqrt(gy.^2+gx.^2);
Gxy;
Gxxyy = displayImage2(Gxy, 'filter z obema');

mks_g = max(max(Gxy));
gy_p = Gxy*255/mks_g;

Gxxyy = displayImage2(gy_p, 'filter z obema');
saveas(Gxxyy,'porocilo/operator.png')
upragovana = thresholdImage(gy_p,255/2);

uprag = displayImage2(upragovana, 'upragovana');
saveas(uprag,'porocilo/prag.png')

[C, A] = getCenterPoint(upragovana,39);
tocka = plot(C(2),C(1) ,'rx')
akumulator = displayImage2(A, 'AKUMULATOR')
saveas(tocka, 'porocilo/tocka.png')
saveas(akumulator, 'porocilo/akumulator.png')