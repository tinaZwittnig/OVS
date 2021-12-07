
imsize = [256,512];
pxDim = [2,1];
gX = [0 imsize(1)*pxDim(1)];
gY = [0 imsize(2)*pxDim(2)];
slika = loadImage('grid-256x512-08bit.raw', imsize, 'uint8');
xy = [
    1 1;
    512 1;
    1 512;
    512 512;
    64 64;
    64 448;
    448 64;
    448 448;
    ];

uv = [
    1 1;
    512 1;
    1 512;
    512 512;
    128 96;
    128 416;
    384 96;
    384 416;
    ];


Tradial = getParameters('radial', uv, xy);
transform_radial = transformImage('radial', slika, pxDim, Tradial, 63, 1);
slika_prikaz = displayImage(transform_radial, 'radialno transformirana', gX, gY);
displayPoints(xy,'rx')
displayPoints(uv,'bo')
saveas(slika_prikaz, 'peta_b3.png')

slika_original = displayImage(slika, 'krogci', gX,gY)
displayPoints(uv,'rx')
saveas(slika_original, 'peta_a2.png')