A = loadImage("head-T2-083x100-08bit.raw", [83,100], 'uint8');
B = loadImage("head-T1-083x100-08bit.raw",[83,100], 'uint8');
C = loadImage("head-SD-083x100-08bit.raw",[83,100], 'uint8');
displayImage2(A,'referencna');
vhodna1 = displayImage2(B,'vhodna');
vhodna2 = displayImage2(C,'vhodna');

[Map, Tx, Ty] = exhaustiveRegistration(A,B, [-15,15,1],[-10,20,1]);
[Map2, Tx2, Ty2] = exhaustiveRegistration(A,C, [-15,15,1],[-10,20,1]);

minim = min(Map(:));
[indy, indx]= find(Map==minim);
x2 = Tx(indx)
y2 = Ty(indy)


paramet = getParameters('affine', [1 1], [x2 y2], 0, [0, 0]);
premik1 = transformImage('affine', B, [1,1], inv(paramet) , 0, 1 );

premik1 = displayImage2(premik1, "premaknjena slika za optimalne parametre");
prikazMatrik = displayImage2(sivinske(Map),'Izris matrike porazdelitve izračunane mere podobnosti')
saveas(prikazMatrik, 'porocilo/sivinske1.png')
minimC = min(Map2(:));
[indyc, indxc]= find(Map2==minimC);
x2c = Tx(indxc)
y2c = Ty(indyc)

parametc = getParameters('affine', [1 1], [x2c y2c], 0, [0, 0]);
premik2 = transformImage('affine', C, [1,1], inv(parametc) , 0, 1 );
displayImage2(premik2, "premaknjena slika za optimalne parametre");
prikaz = displayImage2(sivinske(Map2),'Izris matrike porazdelitve izračunane mere podobnosti');
saveas(prikaz, 'porocilo/sivinske2.png')