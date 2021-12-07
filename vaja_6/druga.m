imsize = [256,512];
pxDim = [2,1];
gX = [0 imsize(1)*pxDim(1)];
gY = [0 imsize(2)*pxDim(2)];
slika = loadImage('lena-256x512-08bit.raw', imsize, 'uint8');
kax = 0.7;
kay = 1.4;

skalriranje = getParameters('affine', [kax kay], [0 0], 0, [0, 0]);
slika_transformirana = transformImage('affine',slika , pxDim, inv(skalriranje) ,63,1);
skalirana_slika = displayImage(slika_transformirana, 'RS slika',gX, gY);
%saveas(skalirana_slika, 'druga_a.png')

txb = 20;
tyb = -30;
translacija = getParameters('affine', [1 1], [txb tyb], 0, [0, 0]);
slika_translacija = transformImage('affine',slika , pxDim, inv(translacija) ,63,1);
translirana_slika = displayImage(slika_translacija, 'T slika',gX, gY);
saveas(translirana_slika, 'druga_b.png')

phic = -30;
rotacija = getParameters('affine', [1 1], [0 0], phic, [0, 0]);
slika_rotacija = transformImage('affine',slika , pxDim, inv(rotacija) ,63,1);
rotirana_slika = displayImage(slika_rotacija, 'RS slika',gX, gY);
%saveas(rotirana_slika, 'druga_c.png')

gxyd = 0.1;
gyxd = 0.5;
strig = getParameters('affine', [1 1], [0 0], 0, [gxyd, gyxd]);
slika_strizenje = transformImage('affine',slika , pxDim, inv(strig) ,63,1);
strig_slika = displayImage(slika_strizenje, 'Striženje slika',gX, gY);
%saveas(strig_slika, 'druga_d.png')

txe = -10;
tye = 20;
phie = 15;

Tphi = getParameters('affine', [1 1], [txe tye],phie, [0, 0]);
slika_Tphi = transformImage('affine',slika , pxDim, inv(Tphi) ,63,1);
Tphi_slika = displayImage(slika_Tphi, 'translacija rotacija slika',gX, gY);
saveas(Tphi_slika, 'druga_e.png')


kxf=0.7;
kyf =0.7;
txf=30;
tyf = -20;
phif=-15;
afina = getParameters('affine', [kxf kyf], [txf tyf], phif, [0, 0]);
slika_afina = transformImage('affine',slika , pxDim, inv(afina) ,63,1);
afina_slika = displayImage(slika_afina, 'afina slika',gX, gY);
saveas(afina_slika, 'druga_f.png')