function oImage = kubSectionalScaleImage(iImage, iS, oS)
%SectionalScaleImage naredi odsekoma nelinearno -kubično preslikavo z danimi parametri
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
      
    sistem = [6.*Cx 2 0 0; %drugi odvod
              Ax^3 Ax^2 Ax 1;
              Bx^3 Bx^2 Bx 1;
              Cx^3 Cx^2 Cx 1;
              ]; % izračunane vrednosti za sistem enačb
   Ay = oS(i);
   By = oS(i+1);
   Cy = oS(i+2);
   
   Y = [0;
       Ay;
       By;
       Cy;
       ]; %Y komponente enačbe
   
   koeficienti = sistem\Y; %rešimo sistem enačb
   
   d1 = koeficienti(1);
   c1 = koeficienti(2);
   b1 = koeficienti(3);
   a1 = koeficienti(4);
   
   

%    plot(Ax,Ay, 'ro',Bx, By, 'ro',Cx,Cy, 'ro')
%    hold on
   xx = linspace(Ax,Cx);
   yy = d1.*xx.^3+c1*xx.^2+b1.*xx + a1;
   plot(xx,yy,'-')
   hold on
   tmp = find(iImage>=Ax & iImage<=Cx);
   %kvadratna funkcija a1*x^2 + b1*x + c1
   oImage(tmp) = d1.*iImage(tmp).^3 + c1 .* iImage(tmp).^2 +b1* iImage(tmp)+ a1;
end