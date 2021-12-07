function oImage = sectionalScaleImage(iImage, iS, oS)
%sectionalScaleImage naredi odsekoma linearno preslikavo z danimi parametri
%vhodni elementi:
%   iImage - vhodna slika v obliki matrike
%   iS - seznam x komponent kontrolnih točk
%   oS - seznam y komponent kontrolnih točk
%izhodni elementi
%   oImgae - preslikana slika

oImage = iImage;
for i = 1: length(iS)-1
    sL = iS(i);% spodnja meja linearnega intervala
    sH = iS(i+1);% zgornja meja linearnega intervala
    
    tmp = find(iImage>=sL & iImage<=sH);
    k = (oS(i+1)-oS(i))/(sH-sL);
    oImage(tmp) = k*(iImage(tmp)-sL) + oS(i);
end
