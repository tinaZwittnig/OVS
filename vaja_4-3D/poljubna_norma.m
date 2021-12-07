imSize = [512 58 907];
vxDim = [0.597656 3 0.597656];

slika = loadImage3D("spine-512x058x907-08bit.raw", imSize, 'uint8');


[rotirana_ravnina2,OH2 , OV2]= getPlanarProjection(slika, vxDim,[1 1 0],'max');
rotiran_prikaz2 = displayImage(rotirana_ravnina2, 'n2',OH2,OV2);

[rotirana_ravnina3,OH3 , OV3]= getPlanarProjection(slika, vxDim,[9.24, 3.83 0],'max');
rotiran_prikaz3 = displayImage(rotirana_ravnina2, 'n3',OH3,OV3);

[rotirana_ravnina1,OH1 , OV1]= getPlanarProjection(slika, vxDim,[ 3.83 9.24 0],'max');
rotiran_prikaz1 = displayImage(rotirana_ravnina2, 'n1',OH1,OV1);
