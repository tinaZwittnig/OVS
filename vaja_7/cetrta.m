slika = loadImage("cameraman-256x256-08bit.raw",[256,256], 'uint8');
displayImage(slika, 'orig')
G = [0.01 0.08 0.01;
    0.08 0.64 0.08;
    0.01 0.08 0.01];
glajenje = spatialFiltering('kernel',slika,G)

maska = slika -glajenje
minimal = min(min(maska))
mks = max(max(maska + abs(minimal)))
maska1 = (maska + abs(minimal))*255/mks
maska1 = displayImage(maska1,'maska')
saveas(maska1,'porocilo/maska.png')
izhodna = slika + 2*maska;
shr = displayImage(izhodna,'izhodna')
saveas(shr, 'porocilo/ostra.png')


