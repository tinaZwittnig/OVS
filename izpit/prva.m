slika = loadImage('rose-366-366-08bit.raw', [366 366], 'uint8');
displayImage(slika,'original');
[indx1, indx2] = getBoundaryIndices(slika, 'x');
[indy1, indy2] = getBoundaryIndices(slika, 'y');


slika1 = slika(indy1:indy2,indx1:indx2);
displayImage(slika1, 'obrezana slika');
B = [slika1(end,:); slika1(end,:)];
[sx1, sx2] = getBoundaryIndices(B, 'x');
[Y,X]=size(slika1);
Sx = round((sx1+sx2)/2);
Sy = Y;

Ly = round(Y/4);
Dy = round(Y/4);

B2 = [slika1(Ly,:); slika1(Ly,:)];
[L, D] = getBoundaryIndices(B2, 'x');

S = [Sx Sy];
L = [L Ly];
D = [D Dy];

%cos phi = a*b/norm[a]norm[b]

a = L-S;
b = D-S;
cosphi = a*b'/(norm(a)*norm(b));
phi = acosd(cosphi)%v stopinjah

povecana = expandImage(slika1);
displayImage(povecana,'povecana');
createRotatedPattern(povecana,20);


