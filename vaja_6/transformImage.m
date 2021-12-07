function oImage = transformImage(iType, iImage, iDim, iP, iBgr, iOrder)
%transformImage transformira dano sliko z tipom transformacije. 
%vhodni parametri:
%   iType - tip tranforamcije 'affine' ali 'radial'
%   iImage - slika, podana v matrični obliki
%   iDim -  dimenzija pikslov podana v [dimX dimY]
%   iP - matrika dane transformacije
%   iBgr - barva odzadja
%   iOrder - željen red interpolacije 0 ali 1
%izhodni parametrri:
%   oImage - transformirana slika

%dimenzija slike
[Y, X] = size(iImage);
%inicializacija izhodne matrike
oImage = ones(Y,X) *iBgr;
for y = 0:Y-1
    for x = 0:X-1
        %koordinate trenutne točke
        pt = [x y].*iDim;
        %afina geometrijska preslikava
        if strcmp(iType, 'affine')
            pt = iP*[pt';1];
            pt = pt(1:2)';
        end
        if strcmp(iType, 'radial')
            U = getRadialValue(pt,iP{1})';
            pt = [U*iP{2}(:,1), U*iP{2}(:,2)];
        end
        pt = pt./iDim;
        %interpolacija reda 0
        if iOrder == 0 %princip najbližjega slikovnega elementa
            px = round(pt); 
            if px(1) <X &&px(2)<Y && px(1)>=0 && px(2)>=0% preverimo veljavnost lokacije slikovnega elementa
                oImage(y+1,x+1) = iImage(px(2)+1,px(1)+1);
        
            end
        elseif iOrder == 1 %interpolacija 1. reda
            px  = floor(pt);
            if px(1) < size(iImage,2) && px(2) < size(iImage,1) && 0<px(1) && 0< px(2)% preverimo veljavnost lokacije slikovnega elementa
                p1 = abs(pt(1)- px(1)) * abs(pt(2)-px(2));
                p2 = abs(pt(1) - (px(1)+1)) * abs(pt(2) -px(2));
                p3 = abs(pt(1) - px(1)) * abs(pt(2) - (px(2) +1));
                p4 = abs(pt(1) - (px(1)+1)) * abs(pt(2) - (px(2) +1));
              
                sa = iImage(px(2),px(1));
                sb = iImage(px(2),px(1)+1);
                sc = iImage(px(2)+1,px(1));
                sd = iImage(px(2)+1,px(1)+1);
                s = floor(p4 * sa + p3 * sb + p2 * sc +p1 * sd);
                oImage(y+1,x+1) = s;
            end
        end
        
    end
end
end
