imSize = [512 58 907];
vxDim = [0.597656 3 0.597656];

slika = loadImage3D("spine-512x058x907-08bit.raw", imSize, 'uint8');
surfaceTriangulation(slika, vxDim,50);