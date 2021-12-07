% originalna slika
slika = loadImage('image-512x512-16bit.raw',[512,512], 'int16');
prikazana = displayImage(slika, 'prikaz');


minimalna_originalna = min(slika(:))
maksimalna_originalna = max(slika(:))

minimalna_originalna_uint = min(prikazana.CData(:))
maksimalna_originalna_uint = max(prikazana.CData(:))

%linearna preslikava
linearna = scaleImage(slika, -0.125, 256);
prikaz_linear = displayImage(linearna, 'preslikana');

minimalna_linearna = min(linearna(:))
maksimalna_linearna = max(linearna(:))


minimalna_linearna_uint = min(prikaz_linear.CData(:))
maksimalna_linearna_uint = max(prikaz_linear.CData(:))

%oknjenje
oknjenje = windowImage(linearna, 1000,500);
prikaz_oknjenje = displayImage(oknjenje, 'oknjenje');
minimalna_oknjenje = min(oknjenje(:))
maksimalna_oknjenje = max(oknjenje(:))
minimalna_oknjenje_uint = min(prikaz_oknjenje.CData(:))
maksimalna_oknjenje_uint = max(prikaz_oknjenje.CData(:))


M = [ 0 85;
    85 0;
    170 255;
    255 170;];

%odsekoma linearna
odsekoma = sectionalScaleImage(oknjenje,M(:,1), M(:,2));
prikaz_odsekoma = displayImage(odsekoma, 'odsekoma');
minimalna_odsekoma_linearna = min(odsekoma(:))
maksimalna_odsekoma_linearna = max(odsekoma(:))
minimalna_odsekoma_uint = min(prikaz_odsekoma.CData(:))
maksimalna_odsekoma_uint = max(prikaz_odsekoma.CData(:))

%gamma preslikava
gamapreslikava = gammaImage(oknjenje, 0.5);
prikaz_gama = displayImage(gamapreslikava, 'gama preslikava');
minimalna_odsekoma_gamma = min(gamapreslikava(:))
maksimalna_odsekoma_gamma = max(gamapreslikava(:))
minimalna_gama_uint = min(prikaz_gama.CData(:))
maksimalna_gama_uint = max(prikaz_gama.CData(:))

%upragovana slika
upragovana = thresholdImage(oknjenje,127);
displayImage(upragovana, 'upragovana slika')
