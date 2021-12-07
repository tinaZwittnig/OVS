addpath('../vaja_1/')
slika = loadImage('pumpkin-200x152-08bit.raw',[200 152],'uint8');
displayImage(slika, 'Buča',200,152)
velikost = size(slika)*2;
interpolirana_slika = interpolateImage(slika, [velikost(2) velikost(1)] , 0);
displayImage(interpolirana_slika, 'Interpolirana ničtega reda',[0 velikost(2)] ,[0 velikost(1)])
size(interpolirana_slika)
interpolirana_slika_prvi = interpolateImage(slika, [velikost(2) velikost(1)] , 1);
displayImage(interpolirana_slika, 'Interpolirana prvega reda',[0 velikost(2)] ,[0 velikost(1)])
size(interpolirana_slika)