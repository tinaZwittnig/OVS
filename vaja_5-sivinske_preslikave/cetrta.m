slika = loadImage('image-512x512-16bit.raw',[512,512], 'int16');
linearna = scaleImage(slika, -0.125, 256);
oknjenje = windowImage(linearna, 1000,500);
displayImage(oknjenje, 'slika');
xS = [0 40 80 127 167 207 255]
yS = [0 255 80 20 167 240 255]
ne_linearna = nonLinearSectionalScaleImage(oknjenje,xS, yS);
displayImage(ne_linearna, 'kvadratna');
hold off
ne_linearna2 = kubSectionalScaleImage(oknjenje,xS, yS);
displayImage(ne_linearna2, 'kubič');