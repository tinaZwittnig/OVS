slika = loadImage("cameraman-256x256-08bit.raw",[256,256], 'uint8');
spremenjena = changeSpatialDomain('enlarge', slika, 128,384,'extrapolation');
povec = displayImage(spremenjena, 'povečana')
saveas(povec, 'porocilo/povec.png')

flip = changeSpatialDomain('enlarge', slika, 128,384,'reflection');

flip_i = displayImage(flip, 'flip')
saveas(flip_i, 'porocilo/flip.png')

period = changeSpatialDomain('enlarge', slika, 128,384,'period');

period_i = displayImage(period, 'period') 
saveas(period_i, 'porocilo/period.png')
constant = changeSpatialDomain('enlarge', slika,128,384,'constant', 127);

con = displayImage(constant, 'constant')
saveas(con, 'porocilo/constant.png')