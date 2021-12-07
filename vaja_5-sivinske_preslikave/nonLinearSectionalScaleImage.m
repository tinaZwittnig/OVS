function oImage = nonLinearSectionalScaleImage(iImage, iS, oS)
%nonLinearSectionalScaleImage naredi odsekoma nelinearno preslikavo z danimi parametri
%vhodni elementi:
%   iImage - vhodna slika v obliki matrike
%   iS - seznam x komponent kontrolnih točk
%   oS - seznam y komponent kontrolnih točk
%izhodni elementi
%   oImgae - preslikana slika

oImage = iImage;
for i = 1: 2:length(iS)-2
    Ax = iS(i);% tocka A
    Bx = iS(i+1);% tocka B
    Cx = iS(i+2); %tocka C
    sistem = [Ax^2 Ax 1;
              Bx^2 Bx 1;
              Cx^2 Cx 1]; % izračunane vrednosti za sistem enačb
   Ay = oS(i);
   By = oS(i+1);
   Cy = oS(i+2);
   Y = [Ay;
       By;
       Cy]; %Y komponente enačbe
   
   koeficienti = sistem\Y %rešimo sistem enačb
   
   i
   a1 = koeficienti(1)
   b1 = koeficienti(2)
   c1 = koeficienti(3)
   tmp = find(iImage>=Ax & iImage<=Cx);
   %kvadratna funkcija a1*x^2 + b1*x + c1
   oImage(tmp) = a1*iImage(tmp).^2 + b1 * iImage(tmp) +c1;
end
