function [oImage, xO, yO] = changeSpatialDomain(iType, iImage, iX, iY, iMode, varargin)
%funkcija zamnjša ali poveča dano sliko
%vhodni elementi:
%   iType - 'enlarge' ali 'reduce'
%   iImage - vhodna slika
%   iX - povečava v x smeri 
%   iY - povečava v x smeri
%izhodni elemenit:
%   oImage - slika 

[Ym, Xm] = size(iImage);
oImage = zeros(Ym+2*iY,Xm+2*iX);
[Yo, Xo] = size(oImage);
oImage(1+iY: end-iY, 1+iX: end-iX) = iImage; %dodamo sliko na sredo
if strcmp(iType, 'enlarge')
    if strcmp(iMode,'constant')
        oImage = ones(Ym+2*iY,Xm+2*iX)*varargin{1};
        oImage(1+iY: end-iY, 1+iX: end-iX) = iImage;
    elseif strcmp(iMode,'extrapolation')
        vrstica1 = repmat(iImage(1,:), [iY,1]);
        size(oImage(1:iY, 1+iX: end-iX))
        oImage(1:iY, 1+iX: end-iX) = vrstica1;
        vrstica2 = repmat(iImage(end,:), [iY,1]);
        oImage(end-iY+1:end, 1+iX: end-iX) = vrstica2;
        stolpec1 = repmat(iImage(:,1), [1,iX]);
        oImage(1+iY: end-iY, 1:iX) = stolpec1;
        stolpec2 = repmat(iImage(:,end), [1,iX]);
        oImage(1+iY: end-iY, end-iX+1:end) = stolpec2;
        oImage(1:iY, 1:iX) = iImage(1,1);
        oImage(end-iY:end, 1:iX)= iImage(end,1);
        oImage(1:iY, end-iX:end)= iImage( 1,end);
        oImage(end-iY:end, end-iX:end)= iImage(end, end);
        oImage(1+iY: end-iY, 1+iX: end-iX) = iImage;
    elseif strcmp(iMode, 'reflection')
        i=1;
        B = (Xo+Xm)/2;
        l=1;
        for x = B:Xo
            oImage(iY+1:end -iY, x) = oImage(iY+1:end -iY, B-i) ; %sprehajamo se od orig.slike do konca izhodne slike 
            oImage(iY+1:end -iY, Xo-x+1) = oImage(iY+1:end -iY, B-Xm+i) ;%sprehajamo se od začetka izhodne slike do originalne slike. 
            if i >= Xm
                l = -1; %če pademo iz originalne slike, se moramo obrniti in iti nazaj
            end
            if i<=1
                l = 1; %če pademo iz originalne slike na durgi strani, se moramo obrniti
            end
            i = i+l;
        end
        C = (Yo+Ym)/2;
        i = 1;
        l = 1;
        for y = C:Yo
            oImage(Yo-y+1,:) = oImage(C-Ym+i, :) ; %podobno kot pri x, kopiramo vse y
            oImage(y, :) = oImage(C-i+1, :) ;
            if i >= Ym
                l = -1;
                
            end
            if i<=1
                l = 1;
            end
            i = i+l;
        end
        
    elseif strcmp(iMode, 'period')
        i=1;
        B = (Xo+Xm)/2;
        
        for x = B:Xo
            oImage(iY+1:end -iY, x) = oImage(iY+1:end -iY, B-Xm+i) ;%sprehajamo se od orig.slike do konca izhodne slike 
            oImage(iY+1:end -iY, Xo-x+1) = oImage(iY+1:end -iY, B-i) ;%sprehajamo se od začetka izhodne slike do originalne slike. 
            if i >= Xm %če pademo iz originalne slike gremo od začetka
                i = 1;
            end
            i = i+1;
        end
        C = (Yo+Ym)/2;
        i = 1;
        for y = C:Yo
            oImage(Yo-y+1,:) = oImage(C-i, :) ; %podobno kot pri y, kopiramo pa vse x
            oImage(y, :) = oImage(C-Ym+i, :) ;
            if i >= Ym
                i = 1; %če pademo iz originalne slike gremo od začetka
            end
            i = i+1;
        end
        
           

       
  
    end
        
        
    
elseif strcmp(iType, 'reduce')
    oImage= iImage(iY+1:end-iY,iX+1:end-iX);
end
end
