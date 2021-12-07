slika = loadImage("cameraman-256x256-08bit.raw",[256,256], 'uint8');
displayImage(slika, 'cameraman')
K = [1 2 1;
    2 4 2;
    1 2 1].*1/16;
jedro = spatialFiltering('kernel', slika, K);
displayImage(jedro , 'filter z jedrom');

statisticno = spatialFiltering('statistical', slika, zeros(3), 'mean');
displayImage(statisticno, 'statistično');


SE=[0 0 1 0 0;
    0 1 1 1 0;
    1 1 1 1 1;
    0 1 1 1 0;
    0 0 1 0 0];
morfolosko = spatialFiltering('morphological', slika, SE , 'erosion');
displayImage(morfolosko, 'morfološko');
