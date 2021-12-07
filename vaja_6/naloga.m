
imsize = [256,512];
pxDim = [2,1];
I = loadImage('lena-256x512-08bit.raw', imsize, 'uint8');


Taffina = getParameters('affine', [1 1], [0 0], 30, [0 0]);
transformirana = transformImage('affine',I , pxDim, inv(Taffina),63,0);



gX= [0 511];
gY = [0 511];
displayImage(transformirana, 'transformirana',gX, gY);

transformirana2 = transformImage('affine',I , pxDim, inv(Taffina),63,1);
displayImage(transformirana2, 'transformirana_prvi_red',gX, gY);


xy = [1 1;
    512 1;
    1 512;
    512 512;];
uv = [1 1;
    512 1;
    1 512;
    256 256;];

displayImage(I, 'original', gX, gY)
displayPoints(xy,'rx')
Tradial = getParameters('radial', xy,uv)

transfor_radial = transformImage('radial', I, pxDim, Tradial, 63, 1);
displayImage(transfor_radial, 'radialno transformirana', gX, gY);
displayPoints(uv, 'bo')

Taffin = getParameters('affine',[1,1] , [-imsize(1)/2 *pxDim(1), -imsize(2)/2 *pxDim(2)], 30, [0 0]);
Ttrans = getParameters('affine', [1,1], [imsize(1)/2*pxDim(1), imsize(2)/2*pxDim(2)],0,[0,0]);
RT= Ttrans*Taffin;
transf = transformImage('affine',I , pxDim, inv(RT),63,0);
displayImage(transf, 'transformirana2',gX, gY);


