slika = loadImage('pumpkin-200x152-08bit.raw',[200 152],'uint8');

M = [1/16 1/8 1/16;
    1/8 1/4 1/8;
    1/16 1/8 1/16];
B = decimateImage(slika, M,3);
displayImage(B, 'decimacija')
axis on 