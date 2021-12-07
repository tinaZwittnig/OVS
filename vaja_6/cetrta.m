imsize = [256,512];
pxDim = [2,1];
gX = [0 imsize(1)*pxDim(1)];
gY = [0 imsize(2)*pxDim(2)];
slika = loadImage('lena-256x512-08bit.raw', imsize, 'uint8');

phi = -30;
rotacijapremik = getParameters('affine',[1,1] , [-imsize(1)/2 *pxDim(1), -imsize(2)/2 *pxDim(2)], phi, [0 0]);
premik = getParameters('affine', [1,1], [imsize(1)/2*pxDim(1), imsize(2)/2*pxDim(2)],0,[0,0]);
RT= premik*rotacijapremik;
transf = transformImage('affine',slika , pxDim, inv(RT),63,1);
slika_rotirana = displayImage(transf, 'rotirana_sredina',gX, gY);
%saveas(slika_rotirana, 'tretja_a.png')


gxyd = 0.1;
gyxd = 0.5;
strig_premik = getParameters('affine', [1 1], [-imsize(1)/2 *pxDim(1), -imsize(2)/2 *pxDim(2)], 0, [gxyd, gyxd]);
RT2 = premik*strig_premik;
slika_strizenje = transformImage('affine',slika , pxDim, inv(RT2) ,63,1);
strig_slika = displayImage(slika_strizenje, 'Striženje slika',gX, gY);
%saveas(strig_slika, 'tretja_b.png')