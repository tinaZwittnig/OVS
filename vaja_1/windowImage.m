function oImage = windowImage(iImage, iC, iW)
%windowImage naredi sivinsko preslikavo linearno oknjenje da dani sliki z
%danimi parametri
%vhodni parametri
%   iImage - dana slika
%   iC - spkupaj z iW nam da mejo za oknjenje
%   iW - spkupaj z iC nam da mejo za oknjenje
%izhodni parametri:
%   oImage - preslikana slika 
oImage = 255/iW * (iImage - (iC-iW/2));
Lg = 2^8
oImage(iImage < iC-iW/2) = 0;
oImage(iImage > iC+iW/2 ) = Lg-1;
end