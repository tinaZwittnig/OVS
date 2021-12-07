slika = loadImage("cameraman-256x256-08bit.raw",[256,256], 'uint8');
displayImage(slika, 'cameraman')
K = [1 2 1;
    2 4 2;
    1 2 1].*1/16;
jedro = spatialFiltering('kernel', slika, K,0, 'constant');
A = displayImage(jedro , 'filter z jedrom');
saveas(A, 'porocilo/A4.png')

statisticno = spatialFiltering('statistical', slika, zeros(3), 'mean',0,'constant');
B = displayImage(statisticno, 'statistično');
saveas(B, 'porocilo/B4.png')


SE=[0 0 1 0 0;
    0 1 1 1 0;
    1 1 1 1 1;
    0 1 1 1 0;
    0 0 1 0 0];

morfolosko = spatialFiltering('morphological', slika, SE , 'erosion',0,'extrapolation');
C = displayImage(morfolosko, 'morfološko');
saveas(C, 'porocilo/C4.png')


