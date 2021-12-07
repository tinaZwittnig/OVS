slika = loadImage("cameraman-256x256-08bit.raw",[256,256], 'uint8');
original = displayImage(slika, 'cameraman');
saveas(original, "porocilo/original.png")

K = [1 2 1;
    2 4 2;
    1 2 1].*1/16;

jedro = spatialFiltering('kernel', slika, K);
slika2 = displayImage(jedro , 'filter z jedrom');
saveas(slika2, "porocilo/slika2.png")
statisticno = spatialFiltering('statistical', slika, zeros(3), 'median');
slika3 = displayImage(statisticno, 'statistično');
saveas(slika3, "porocilo/slika3.png")
SE=[0 0 1 0 0;
    0 1 1 1 0;
    1 1 1 1 1;
    0 1 1 1 0;
    0 0 1 0 0];
morfolosko = spatialFiltering('morphological', slika, SE , 'erosion');
slika4 = displayImage(morfolosko, 'morfološko');
saveas(slika4, "porocilo/slika4.png")

